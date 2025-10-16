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
