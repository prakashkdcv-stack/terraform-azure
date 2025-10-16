output "control-plane-ipaddress" {
    value = azurerm_network_interface.control_nic.private_ip_address
  
}

output "worker_node1-ipaddress" {
  value = azurerm_network_interface.worker1_nic.private_ip_address
}

output "worker_node2-ipaddress" {
  value = azurerm_network_interface.worker2_nic.private_ip_address
}