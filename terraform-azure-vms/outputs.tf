output "client_vm_public_ip" {
  value = module.clientvm.vm-ipaddress
}

output "client_vm_private_ip" {
  value = module.clientvm.vm-private-ipaddress
}
output "vms_username" {
  value = module.clientvm.vm-username
  
}

output "controlplane_ip"{
  value = module.k8s-cluster.control-plane-ipaddress

}
output "worker_node1_ip"{
  value = module.k8s-cluster.worker_node1-ipaddress

}
output "worker_node2_ip"{
  value = module.k8s-cluster.worker_node2-ipaddress

}