###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "subnets" {
  type = map(object({
    zone = string
    cidr = list(string)
  }))
  default = {
    "d" = {
      zone = "ru-central1-d"
      cidr = ["10.0.2.0/24"]
    }
    "e" = {
      zone = "ru-central1-e"
      cidr = ["10.0.4.0/24"]
    }
  }
}

variable "vpc_name" {
  type = string
  default = "develop"
  description = "VPC network&subnet name"
}

variable "vm_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Образ db-сервера"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Платформа db-сервера"
}

variable "each_vm" {
  type = list(object({
    vm_name = string
    cpu = number
    ram = number
    disk_volume = number
    subnet_key = string
  }))
  default = [
    {
      vm_name = "main"
      cpu = 2
      ram = 2
      disk_volume = 11
      subnet_key = "d"
    },
    {
      vm_name = "replica"
      cpu = 2
      ram = 1
      disk_volume = 10
      subnet_key = "e"
    }
  ]
}

variable "vm_resource" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
    disk_size = number
    disk_type = string
  }))
  default = {
    count = {
      cores = 2
      memory = 2
      core_fraction = 20
      disk_size = 10
      disk_type = "network-hdd"
    }
    storage = {
      cores = 2
      memory = 2
      core_fraction = 20
      disk_size = 10
      disk_type = "network-ssd"
    }
  }
}

variable "storage_disk_resource" {
  type = map(object({
    disk_size = number
    disk_type = string
  }))
  default = {
    count = {
      disk_size = 1
      disk_type = "network-hdd"
    }
  }
}

variable "storage_vm_name" {
  type    = string
  default = "storage"
}

variable "storage_subnet_key" {
  type    = string
  default = "a"
}

variable "storage_disk_count" {
  type    = number
  default = 3
}

variable "storage_disk_name_prefix" {
  type    = string
  default = "storage-disk"
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "Флаг прерываемости вм"
}

variable "vm_nat" {
  type        = bool
  default     = true
  description = "Наличие публичного ip"
}