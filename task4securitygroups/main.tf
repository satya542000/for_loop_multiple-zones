module "configuration1" {
  source = "./NIC"
  counting = 3 
  nic = "nic_count"
  ipconfig = "satyaip"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid
  zonenumber = [1,2,3]
}
module "configuration2" {
  source = "./Resourcegroup"
  resource_group = "satyaRGNew"
  location = "eastus"
}
module "configuration3" {
  source = "./VM"
  counting = 3 
  size = "standard_f2"
  vmuser_name = "satyaweb1"
  user_password = "websatya@2022"
  rights = "ReadWrite"
  storage = "Standard_LRS"
  micsft = "microsoftwindowsserver"
  win = "windowsserver"
  vmwin_versing = "2016-datacenter"
  location = "eastus"
  rg = module.configuration2.rgid
  nic = module.configuration1.nicid
  zonenumber = [1,2,3]
}
module "configuration4" {
  source = "./VNet"
  vnet = "satyavnet"
  cidr_block = "172.162.0.0/16"
  vsub = "satyasubnet"
  ip_address = "172.162.2.0/24"
  location = "eastus"
  rg = module.configuration2.rgid
}
module "configuration5" {
  source = "./security"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid  
}