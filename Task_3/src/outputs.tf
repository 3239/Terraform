locals {
  all_instances = concat(yandex_compute_instance.web, values(yandex_compute_instance.db))
}

output "vm" {
  value = [for vm in local.all_instances : {
    name = vm.name
    ip = vm.network_interface[0].nat_ip_address != "" ? vm.network_interface[0].nat_ip_address : vm.network_interface[0].ip_address
  }]
}

output "web_servers" {
  value = [for vm in yandex_compute_instance.web : vm.name]
}

output "db_servers" {
  value = [for vm in yandex_compute_instance.db : vm.name]
}

output "storage_vm" {
  value = {
    name = yandex_compute_instance.storage.name
    zone = yandex_compute_instance.storage.zone
    public_ip = yandex_compute_instance.storage.network_interface[0].nat_ip_address

    boot_disk_id = yandex_compute_instance.storage.boot_disk[0].disk_id
    
    secondary_disks = [for disk in yandex_compute_disk.storage : {
      name = disk.name
      size = disk.size
      type = disk.type
    }]

    total_disks = 1 + length(yandex_compute_disk.storage) 
  }
}