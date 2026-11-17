locals {
  all_instances = concat(yandex_compute_instance.web, values(yandex_compute_instance.db))
}

output "vm" {
  value = [for vm in local.all_instances : {
    name = vm.name
    ip   = vm.network_interface[0].nat_ip_address != "" ? vm.network_interface[0].nat_ip_address : vm.network_interface[0].ip_address
  }]
}

output "web_servers" {
  value = [for vm in yandex_compute_instance.web : vm.name]
}

output "db_servers" {
  value = [for vm in yandex_compute_instance.db : vm.name]
}