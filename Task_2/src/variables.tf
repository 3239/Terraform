###cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default = "b1g6ddgf30mam8s1pe2s"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default = "b1gl823eph1sgdfe6qe6"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-d"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.3.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_db_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Образ db-сервера"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Имя db-сервера"
}

variable "vm_db_hostname" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Hostname db-сервера"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Платформа db-сервера"
}

# variable "vm_db_cores" {
#   type        = number
#   default     = 2
#   description = "CPU"
# }
# variable "vm_db_memory" {
#   type        = number
#   default     = 2
#   description = "Объём оперативной памяти"
# }
# variable "vm_db_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Гарантированная доля CPU в процентах"
# }
# variable "vm_db_disk_type" {
#   type        = string
#   default     = "network-hdd"
#   description = "Тип диска"
# }
# variable "vm_db_disk_size" {
#   type        = number
#   default     = 10
#   description = "Размер диска"
# }

variable "vm_resource" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
    disk_size = number
    disk_type = string
  }))
  default = {
    web = {
      cores = 2
      memory = 2
      core_fraction = 20
      disk_size = 10
      disk_type = "network-hdd"
    }
    db = {
      cores = 2
      memory = 2
      core_fraction = 20
      disk_size = 10
      disk_type = "network-hdd"
    }
  }
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Флаг прерываемости вм"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "Наличие публичного ip"
}

###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC+YrM6BLn5h5k7lFpgXS/+dkJhz4P6bdwRnxgdewG7C aeps@test-ubuntu"
#   description = "ssh-keygen -t ed25519"
# }

variable "vm_metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys = string
  }))
  default = {
    metadata = {
      serial-port-enable = 1
      ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC+YrM6BLn5h5k7lFpgXS/+dkJhz4P6bdwRnxgdewG7C aeps@test-ubuntu"
    }
  }
}