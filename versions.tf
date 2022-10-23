# Provider
terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.80.0"
    }
  }
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "aleksturbo"
    key      = "terraform.tfstate"
    region   = "ru-central1-a"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
