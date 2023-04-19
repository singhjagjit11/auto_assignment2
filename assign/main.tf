#root module main.tf


module "rgroup" {
  source = "./modules/rgroup"
}


module "network" {
  source = "./modules/network"

  resource_group_name = "N01574661-assignment1-RG"
  subnet_name         = "4661subnet"

  tags = var.tags
}

module "common" {
  source = "./modules/common"

  resource_group_name = "N01574661-assignment1-RG"
  location            = "eastus"
  tags                = var.tags
}
module "vmlinux" {
  source   = "./modules/vmlinux"

  vm_count = 2
  vm_size  = "Standard_B1s"
  ssh_user = "centos"

  subnet_id   = module.network.subnet_id
  vnet_name   = module.network.vnet_name
  subnet_name = module.network.subnet_name
  storage_account_uri = module.common.storage_account_uri
}

module "vm_windows" {
  source                          = "./modules/vmwindows"
  resource_group_name             = "N01574661-assignment1-RG"
  location                        = "eastus"
  subnet_id                       = module.network.subnet_id
  vm_name                         = "vm-windows"
  vm_size                         = "Standard_B1s"

  admin_username                  = "jagjit"
  admin_password                  = "Jagjit@1998"
  os_disk_name                    = "osdisk-windows"
  os_type                         = "Windows"
  dns_label                       = "public-ipwindows"
  avail_set_name                  = "4661windows-avail-set"
  public_ip_dns_label             = "win4661publicip"
  antimalware_extension_name      = "IaaSAntimalware"
  antimalware_extension_publisher = "Microsoft.Azure.Security"
  antimalware_extension_type      = "IaaSAntimalware"
  antimalware_extension_version   = "1.3"
  boot_diagnostics_storage_uri    = module.common.storage_account_uri
}
module "datadisk" {
  source              = "./modules/datadisk"
  location            = "eastus"
  resource_group_name = "N01574661-assignment1-RG"
  subnet_id           = module.network.subnet_id
  vm_count            = 3
  tags                = var.tags

  linux_vm_ids        = module.vmlinux.vm_ids

  vmwindows_vm_id     = module.vm_windows.vm_id
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
   resource_group_name = "N01574661-assignment1-RG"
  location            = "eastus"

linux_vm_ids = module.vmlinux.vm_ids

}

module "database" {
  source              = "./modules/database"
  prefix              = "n4661"
  location            = "eastus"
  resource_group_name = "N01574661-assignment1-RG"
  db_name             = "mydatabase"

  db_username   = "jagjit"
  db_password   = "J@gjit1998"
}
#  resource "null_resource" "ansible" {
#   provisioner "local-exec" {
#         command = "/usr/bin/ansible-playbook -i /home/jagjit/automation/anisble/assign2/hosts /home/jagjit/automation/anisble/assign2/groupX-playbook.yaml"
# }
# }






