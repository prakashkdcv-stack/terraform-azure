#Landing zone values
resource-group-name = "rg-landingzone-cka"
location = "Central India"
vnet-name = "vnet-cka"
vnet-address-space = [ "10.0.0.0/16" ]
client-subnet = "client-subnet"
client-subnet-address-prefixes = [ "10.0.1.0/24" ]
client-nsg-name = "client-nsg"
# client-security-rules = {
  
# }
cluster-subnet = "cluster-subnet"
cluster-subnet-address-prefixes = [ "10.0.2.0/24" ]
cluster-nsg-name = "cluster-nsg"
# cluster-security-rules = {
  
# }
storage-account-name = "strckaramana"

#ClienVM module values
rg-client-name = "rg-client"
client-nic = "nic-client"
client-vm-name = "client-vm"
vm-size = "Standard_D4_v4" #"Standard_B4s_v2"
admin-password = "Pra5ann#5148"
admin-username = "buramana"

#Cluster Module values
rg-cluster-name = "rg-cka-cluster"
cluster-admin-password = "Pra5ann#5148"
cluster-admin-username = "buramana"
cluster-vm-size = "Standard_B4s_v2"
control-vm-name = "control-plane"
worker1-vm-name = "worker-node1"
worker2-vm-name = "worker-node2"