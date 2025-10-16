output "vm-ipaddress" {
    value = azurerm_public_ip.client_public_ip.ip_address
  
}

output "vm-private-ipaddress" {
    value = azurerm_network_interface.client_nic.private_ip_address
  
}

output "vm-username" {
  value = azurerm_windows_virtual_machine.client_vm.admin_username
}
