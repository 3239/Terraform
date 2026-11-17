resource "yandex_compute_instance" "web" {
  depends_on = [yandex_compute_instance.db]

  count = 2

  name = "web-${count.index + 1}"
  hostname = "web-${count.index + 1}"
  platform_id = var.vm_platform_id
  zone = var.default_zone

  resources {
    cores = var.vm_resource.count.cores
    memory = var.vm_resource.count.memory
    core_fraction = var.vm_resource.count.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.vm_resource.count.disk_type
      size = var.vm_resource.count.disk_size
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  scheduling_policy { 
    preemptible = var.vm_preemptible 
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat = var.vm_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  allow_stopping_for_update = true
}