provider "yandex" {
  service_account_key_file = "key.json"
  zone                     = "ru-central1-a"
  cloud_id                 = var.yandex_cloud_id
  folder_id                = var.yandex_folder_id
}

locals {
  web_instance_count_map = {
    stage = 1
    prod  = 2
  }
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

resource "yandex_vpc_network" "net" {
  name = "net"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  network_id     = resource.yandex_vpc_network.net.id
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = "ru-central1-a"
}

resource "yandex_compute_instance" "vm" {
  count       = "1"
  name        = "srv-cnt-01"
  hostname    = "srv-cnt-01"
  platform_id = "standard-v1"

  description = "Srv-cnt-01"

  lifecycle {
    create_before_destroy = true
  }

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      type     = "network-hdd"
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
    ipv6      = false
  }
  
}
