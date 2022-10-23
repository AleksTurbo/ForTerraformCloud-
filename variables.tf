variable "yandex_cloud_id" {
  default = "b1gk0tcpmdt9lhdnsjrl"
}

variable "yandex_folder_id" {
  default = "b1g1qalus625i26qmq56"
}

variable "platform-id" {
  description = "Type of platform (CPU)"
  type        = map
  default     = {
    node_1 = {
      platform_id           = "standard-v1",
      name                    = "each-00"
    },
    node_2 = {
      platform_id           = "standard-v2",
      name                    = "each-01"
    }
  }
}