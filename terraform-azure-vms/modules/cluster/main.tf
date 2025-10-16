resource "azurerm_resource_group" "rg-cluster" {
  name = var.rg-name
  location = var.rg-location
}
resource "azurerm_network_interface_security_group_association" "control" {
  network_interface_id = azurerm_network_interface.control_nic.id
  network_security_group_id = var.cluster-nsg-id
  
}
resource "azurerm_network_interface" "control_nic" {
  name                = "control-nic"
  location            = azurerm_resource_group.rg-cluster.location
  resource_group_name = azurerm_resource_group.rg-cluster.name

  ip_configuration {
    name                          = "control-ip-config"
    subnet_id                     = var.cluster_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "control_plane" {
  name                = var.control-vm-name #"control-plane"
  resource_group_name = azurerm_resource_group.rg-cluster.name
  location            = azurerm_resource_group.rg-cluster.location
  size                = "Standard_B2s"
  admin_username      = var.admin-username #"azureuser"
  admin_password      = var.admin-password #"P@ssword1234!"
  network_interface_ids = [azurerm_network_interface.control_nic.id]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "24.04.202404230"
  }
}
resource "azurerm_network_interface" "worker1_nic" {
  name                = "worker1-nic"
  location            = azurerm_resource_group.rg-cluster.location
  resource_group_name = azurerm_resource_group.rg-cluster.name

  ip_configuration {
    name                          = "worker1-ip-config"
    subnet_id                     = var.cluster_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "worker_node1" {
  name                = var.worker1-vm-name #"worker-node1"
  resource_group_name = azurerm_resource_group.rg-cluster.name
  location            = azurerm_resource_group.rg-cluster.location
  size                = "Standard_B2s"
  admin_username      = var.admin-username #"azureuser"
  admin_password      = var.admin-password #"P@ssword1234!"
  network_interface_ids = [azurerm_network_interface.worker1_nic.id]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "24.04.202404230"
  }
}

resource "azurerm_network_interface" "worker2_nic" {
  name                = "worker2-nic"
  location            = azurerm_resource_group.rg-cluster.location
  resource_group_name = azurerm_resource_group.rg-cluster.name

  ip_configuration {
    name                          = "worker2-ip-config"
    subnet_id                     = var.cluster_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "worker_node2" {
  name                = var.worker2-vm-name #"worker-node2"
  resource_group_name = azurerm_resource_group.rg-cluster.name
  location            = azurerm_resource_group.rg-cluster.location
  size                = "Standard_B2s"
  admin_username      = var.admin-username #"azureuser"
  admin_password      = var.admin-password #"P@ssword1234!"
  network_interface_ids = [azurerm_network_interface.worker2_nic.id]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "24.04.202404230"
  }
}

resource "azurerm_network_interface_security_group_association" "worker1" {
  network_interface_id = azurerm_network_interface.worker1_nic.id
  network_security_group_id = var.cluster-nsg-id
  
}

resource "azurerm_network_interface_security_group_association" "worker2" {
  network_interface_id = azurerm_network_interface.worker2_nic.id
  network_security_group_id = var.cluster-nsg-id
  
}