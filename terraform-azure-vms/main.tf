module "landingzone" {
  source = "./Landingzone"
  resource-group-name = var.resource-group-name
  location = var.location
  vnet-name = var.vnet-name
  vnet-address-space = var.vnet-address-space 
  client-subnet = var.client-subnet
  client-subnet-address-prefixes = var.client-subnet-address-prefixes
  cluster-subnet = var.cluster-subnet
  cluster-subnet-address-prefixes = var.cluster-subnet-address-prefixes
  client-nsg-name = var.client-nsg-name
  # client-security-rules = var.client-security-rules
  cluster-nsg-name = var.cluster-nsg-name
  # cluster-security-rules = var.cluster-security-rules
  storage-account-name = var.storage-account-name

}

module "clientvm" {
  source = "./modules/clientvm"
  rg-name = var.rg-client-name
  rg-location = module.landingzone.rg-location
  admin-password = var.admin-password
  admin-username = var.admin-username
  client-nsg-id = module.landingzone.client-nsg-id
  client_subnet_id = module.landingzone.client-subnet-id
  client-vm-name = var.client-vm-name
  client-nic = var.client-nic
  vm-size = var.vm-size
  
}

module "k8s-cluster" {
  source = "./modules/cluster"
  admin-password = var.cluster-admin-password
  admin-username = var.cluster-admin-username
  cluster_subnet_id = module.landingzone.cluster-subnet-id
  cluster-nsg-id = module.landingzone.cluster-nsg-id
  vm-size = var.cluster-vm-size
  control-vm-name = var.control-vm-name
  worker1-vm-name = var.worker1-vm-name
  worker2-vm-name = var.worker2-vm-name
  rg-location = module.landingzone.rg-location
  rg-name = var.rg-cluster-name
  
}