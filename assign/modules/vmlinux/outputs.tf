output "vm_hostnames" {
  value = [for vm in azurerm_linux_virtual_machine.vm : vm.name]
}

output "vm_domain_names" {
  value = [for vm in azurerm_linux_virtual_machine.vm : vm.computer_name]
}

output "vm_private_ips" {
  value = [for nic in azurerm_network_interface.nic : nic.private_ip_address]
}

output "vm_public_ips" {
  value = [for ip in azurerm_public_ip.public_ip : ip.ip_address]
}

output "vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.vm : vm.id]
}
