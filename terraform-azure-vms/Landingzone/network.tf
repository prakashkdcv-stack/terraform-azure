resource "azurerm_resource_group" "rg" {
  name     = var.resource-group-name #"cka-practice-rg"
  location = var.location #"Central India"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name #"cka-vnet"
  address_space       = var.vnet-address-space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "client_subnet" {
  name                 = var.client-subnet #"client-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.client-subnet-address-prefixes
}

resource "azurerm_subnet" "cluster_subnet" {
  name                 = var.cluster-subnet #"cluster-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.cluster-subnet-address-prefixes
}

resource "azurerm_network_security_group" "client-nsg" {
  name = var.client-nsg-name
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  
}

resource "azurerm_network_security_rule" "client-inbound" {
  access = "Allow"
  direction = "Inbound"
  name = "Inbound-rdp"
  network_security_group_name = azurerm_network_security_group.client-nsg.name
  protocol = "Tcp"
  priority = 100
  destination_address_prefix = "*"
  source_address_prefix = "*"
  destination_port_range = 3389
  source_port_range = "*"
  resource_group_name = azurerm_resource_group.rg.name
  
}

resource "azurerm_network_security_rule" "client-outbound" {
  access = "Allow"
  direction = "Outbound"
  name = "Outbound-all"
  network_security_group_name = azurerm_network_security_group.client-nsg.name
  protocol = "Tcp"
  priority = 200
  destination_address_prefix = "*"
  source_address_prefix = "*"
  destination_port_range = "*"
  source_port_range = "*"
  resource_group_name = azurerm_resource_group.rg.name
  
}

resource "azurerm_network_security_group" "cluster-nsg" {
  name = var.cluster-nsg-name
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
    
}

resource "azurerm_network_security_rule" "cluster-inbound" {
  access = "Allow"
  direction = "Inbound"
  name = "Inbound-rdp"
  network_security_group_name = azurerm_network_security_group.cluster-nsg.name
  protocol = "Tcp"
  priority = 100
  destination_address_prefix = "*"
  source_address_prefix = "*"
  destination_port_range = "*"
  source_port_range = "*"
  resource_group_name = azurerm_resource_group.rg.name
  
}

resource "azurerm_network_security_rule" "cluster-outbound" {
  access = "Allow"
  direction = "Outbound"
  name = "Outbound-all"
  network_security_group_name = azurerm_network_security_group.cluster-nsg.name
  protocol = "Tcp"
  priority = 200
  destination_address_prefix = "*"
  source_address_prefix = "*"
  destination_port_range = "*"
  source_port_range = "*"
  resource_group_name = azurerm_resource_group.rg.name
  
}
