locals {
  vm_web_name = "netology-${var.vpc_name}-platform-web-${var.default_zone}"
  vm_web_hostname = "netology-${var.vpc_name}-platform-web-${var.default_zone}"
  
  vm_db_name = "netology-${var.vpc_name}-platform-db-${var.vm_db_zone}"
  vm_db_hostname  = "netology-${var.vpc_name}-platform-db-${var.vm_db_zone}"
}