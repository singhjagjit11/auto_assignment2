
output "resource_group_name" {
  value = module.rgroup.resource_group_name
}


#network
output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

#common
output "la_workspace_name" {
  value = module.common.la_workspace_name
}

output "rs_vault_name" {
  value = module.common.rs_vault_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}


#linux

output "vm_hostnames" {

  value = module.vmlinux.vm_hostnames
}

output "vm_domains" {
  value = module.vmlinux.vm_domain_names
}

output "vm_private_ips" {
  value = module.vmlinux.vm_private_ips
}

output "vm_public_ips" {
  value = module.vmlinux.vm_public_ips
}


#windows

output "vm_windows_hostname" {
  value     = module.vm_windows.vm_hostname
  sensitive = true
}

output "vm_windows_private_ip" {
  value = module.vm_windows.vm_private_ip_address
}

output "vm_windows_public_ip" {
  value = module.vm_windows.vm_public_ip_address
}


output "linux_vm_ids" {

  value = module.vmlinux.vm_ids

}

output "vmwindows_vm_id" {
  value = module.vm_windows.vm_id
}


output "load_balancer_name" {
  value = module.loadbalancer.lb_name
}





output "database_name" {
  value = module.database.database_name
}
