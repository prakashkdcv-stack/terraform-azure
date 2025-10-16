variable "rg-name" {
  type = string
}

variable "rg-location" {
  type = string

}

variable "cluster_subnet_id" {
  type = string
}
variable "cluster-nsg-id" {
  type = string
}

variable "control-vm-name" {
  type = string
}

variable "worker1-vm-name" {
  type = string
}

variable "worker2-vm-name" {
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