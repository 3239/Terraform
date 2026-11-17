resource "yandex_compute_disk" "storage" {
  count = var.storage_disk_count

  name = "${var.storage_disk_name_prefix}-${count.index}"
  zone = "ru-central1-d"
  size = var.storage_disk_resource.count.disk_size
  type = var.storage_disk_resource.count.disk_type
}

resource "yandex_compute_instance" "storage" {
  name = var.storage_vm_name
  hostname = var.storage_vm_name
  platform_id = var.vm_platform_id
  zone = "ru-central1-d"

  resources {
    cores = var.vm_resource.storage.cores
    memory = var.vm_resource.storage.memory
    core_fraction = var.vm_resource.storage.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.vm_resource.storage.disk_type
      size = var.vm_resource.storage.disk_size
    }
  }

  dynamic "secondary_disk" {
    for_each = range(var.storage_disk_count)
    content {
      disk_id = yandex_compute_disk.storage[secondary_disk.value].id
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop["d"].id
    nat = var.vm_nat
  }

  allow_stopping_for_update = true
}