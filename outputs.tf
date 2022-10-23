output "yandex_vpc_subnet" {
  value       = resource.yandex_vpc_subnet.subnet.id
  description = "Subnet ID where the instance was created"
}

output "internal_ip_address_vm" {
  value = yandex_compute_instance.vm.*.network_interface.0.ip_address
}