output "rg-name" {
  value = azurerm_resource_group.rg.name
}

output "rg-location" {
    value = azurerm_resource_group.rg.location
}

output "vnet-id" {
    value = azurerm_virtual_network.vnet.id
  
}

output "client-subnet-id" {
    value = azurerm_subnet.client_subnet.id
  
}
output "cluster-subnet-id" {
    value = azurerm_subnet.cluster_subnet.id
  
}

output "client-nsg-id" {
    value = azurerm_network_security_group.client-nsg.id
  
}

output "cluster-nsg-id" {
    value = azurerm_network_security_group.cluster-nsg.id
  
}