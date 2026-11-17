resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = each.value.vm_name
  hostname    = each.value.vm_name
  platform_id = var.vm_platform_id
  zone        = var.subnets[each.value.subnet_key].zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = var.vm_resource.count.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_resource.count.disk_type
      size     = each.value.disk_volume
    }
  }

  scheduling_policy { 
    preemptible = var.vm_preemptible 
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop[each.value.subnet_key].id
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  allow_stopping_for_update = true
}