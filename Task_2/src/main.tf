resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop-a" {
  name           = "${var.vpc_name}-ru-central1-a"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop-d" {
  name           = "${var.vpc_name}-ru-central1-d"
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image
}

resource "yandex_compute_instance" "platform_web" {
  name = local.vm_web_name
  hostname = local.vm_web_hostname
  platform_id = var.vm_web_platform_id
  zone = var.default_zone

  resources {
    cores         = var.vm_resource.web.cores
    memory        = var.vm_resource.web.memory
    core_fraction = var.vm_resource.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.vm_resource.web.disk_type
      size = var.vm_resource.web.disk_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat       = var.vm_web_nat
  }

  metadata = var.vm_metadata.metadata
}

resource "yandex_compute_instance" "platform_db" {
  name = local.vm_db_name
  hostname = local.vm_db_hostname
  platform_id = var.vm_db_platform_id
  zone = var.vm_db_zone

  resources {
    cores         = var.vm_resource.db.cores
    memory        = var.vm_resource.db.memory
    core_fraction = var.vm_resource.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.vm_resource.db.disk_type
      size = var.vm_resource.db.disk_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop-d.id
    nat = var.vm_db_nat
  }

   metadata = var.vm_metadata.metadata
}