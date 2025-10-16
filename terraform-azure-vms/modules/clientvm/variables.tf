variable "client-nic" {
  type = string
}

variable "rg-name" {
  type = string
}

variable "rg-location" {
  type = string

}

variable "client_subnet_id" {
  type = string
}

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
variable "client-nsg-id" {
  type = string
}