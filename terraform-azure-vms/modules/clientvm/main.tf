resource "azurerm_resource_group" "rg-client" {
  name = var.rg-name
  location = var.rg-location
}

resource "azurerm_network_interface" "client_nic" {
  name                = var.client-nic #"client-nic"
  location            = azurerm_resource_group.rg-client.location
  resource_group_name = azurerm_resource_group.rg-client.name

  ip_configuration {
    name                          = "client-ip-config"
    subnet_id                     = var.client_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.client_public_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "name" {
  network_interface_id = azurerm_network_interface.client_nic.id
  network_security_group_id = var.client-nsg-id
  
}
resource "azurerm_public_ip" "client_public_ip" {
  name                = "client-public-ip"
  location            = azurerm_resource_group.rg-client.location
  resource_group_name = azurerm_resource_group.rg-client.name
  allocation_method   = "Dynamic"
}


resource "azurerm_windows_virtual_machine" "client_vm" {
  name                = var.client-vm-name #"client-vm"
  resource_group_name = azurerm_resource_group.rg-client.name
  location            = azurerm_resource_group.rg-client.location
  size                = var.vm-size #"Standard_B2s"
  admin_username      = var.admin-username #"azureuser"
  admin_password      = var.admin-password
  network_interface_ids = [azurerm_network_interface.client_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-23h2-pro"
    version   = "latest" #22631.5335.250509
  }
}