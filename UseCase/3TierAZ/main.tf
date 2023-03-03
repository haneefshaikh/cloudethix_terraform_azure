// TAG
module "TAG" {
  source      = "./MODULES/TAG"
  application = var.application
  product     = var.product
  environment = var.environment
}

//RG
module "RG" {
  source      = "./MODULES/RG"
  tag         = module.TAG.tag
  rg_location = var.rg_location
  tag_names   = module.TAG.tag_names
}

//VNET
module "VNET" {
  source      = "./MODULES/VNET"
  tag         = module.TAG.tag
  tag_names   = module.TAG.tag_names
  rg_name     = module.RG.rg_name
  rg_location = module.RG.rg_location
  vnet_cidr   = var.vnet_cidr
  subnet_cidr = var.subnet_cidr
}

//VM
module "VM" {
  source      = "./MODULES/VM"
  tag         = module.TAG.tag
  tag_names   = module.TAG.tag_names
  rg_name     = module.RG.rg_name
  rg_location = module.RG.rg_location
  vm_name     = var.vm_name
  public_ip   = module.VNET.public_ip
  subnet_id   = element(module.VNET.subnet_ids, 0)
  vm_type     = var.vm_type
  vm_username = var.vm_username
  vm_hostname = var.vm_hostname
  vm_password = var.vm_password
}

//LB
module "LB" {
  source      = "./MODULES/LB"
  tag         = module.TAG.tag
  tag_names   = module.TAG.tag_names
  rg_name     = module.RG.rg_name
  rg_location = module.RG.rg_location
  public_ip   = module.VNET.public_ip
}