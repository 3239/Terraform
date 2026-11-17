resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop-a" {
  name           = "${var.vpc_name}-ru-central1-a"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


resource "yandex_vpc_subnet" "develop" {
  for_each = var.subnets

  name           = "${var.vpc_name}-ru-central1-${each.key}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = each.value.cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_image
}

