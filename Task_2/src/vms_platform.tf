variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Образ для виртуальной машины"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Имя виртуальной машины"
}

variable "vm_web_hostname" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Hostname виртуальной машины"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Платформа виртуальной машины"
}

# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "CPU"
# }
# variable "vm_web_memory" {
#   type        = number
#   default     = 2
#   description = "Объём оперативной памяти"
# }
# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Гарантированная доля CPU в процентах"
# }
# variable "vm_web_disk_type" {
#   type        = string
#   default     = "network-hdd"
#   description = "Тип диска"
# }
# variable "vm_web_disk_size" {
#   type        = number
#   default     = 10
#   description = "Размер диска"
# }

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Флаг прерываемости вм"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Наличие публичного ip"
}