# Landing zone variables
variable "resource-group-name" {
    type = string
    description = "Resource group name for vnet"
  }

variable "location" {
  type = string
  default = "Central India"
}
variable "vnet-name" {
  type = string
  default = "cka-vnet"
  
}

variable "vnet-address-space" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
  
}

variable "storage-account-name" {
  type = string
  description = "Enter the storage account name"
  validation {
    condition = length(var.storage-account-name) >= 1 && length(var.storage-account-name) <= 24
    error_message = "Storage account name should be less than 24"
  }
}

variable client-subnet {
  type = string
  default = "client-subnet"
}
variable client-subnet-address-prefixes {
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable cluster-subnet {
  type = string
  default = "cluster-subnet"
}

variable cluster-subnet-address-prefixes {
  type = list(string)
  default = ["10.0.2.0/24"]
}

variable "client-nsg-name" {
 type = string 
}

# variable "client-security-rules" {
#   type  = map(any)
  
# }

variable "cluster-nsg-name" {
 type = string 
}

# variable "cluster-security-rules" {
#   type  = map(any)
  
# }

# Client module variables
variable "client-nic" {
  type = string
}

variable "rg-client-name" {
  type = string
}

# variable "rg-location" {
#   type = string

# }

# variable "client_subnet_id" {
#   type = string
# }

variable "client-vm-name" {
  type = string
}
variable "admin-password" {
  type = string
  sensitive = true
  validation {
    condition = length(var.admin-password) >=6 && length(var.admin-password) <=12
    error_message = "Password should be minimum 6 char and max 12 chars"
  }
}

variable "admin-username" {
  type = string
}

variable "vm-size" {
    type = string
    default = "Standard_B2s"
  
}
# variable "client-nsg-id" {
#   type = string
# }

#Cluster module variables
variable "rg-cluster-name" {
  type = string
}
# variable "cluster_subnet_id" {
#   type = string
# }
variable "control-vm-name" {
  type = string
}

variable "worker1-vm-name" {
  type = string
}

variable "worker2-vm-name" {
  type = string
}

variable "cluster-admin-password" {
  type = string
  sensitive = true
  validation {
    condition = length(var.cluster-admin-password) >=6 && length(var.cluster-admin-password) <=12
    error_message = "Password should be minimum 6 char and max 12 chars"
  }
}

variable "cluster-admin-username" {
  type = string
}

variable "cluster-vm-size" {
    type = string
    default = "Standard_B2s"
  
}