resource "azurerm_network_interface" "nic" {
  count = var.counting
  name                = format("${var.nic}-%g", count.index+1)  
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    name                          = var.ipconfig
    subnet_id                     = var.vsubid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip[count.index].id 
}
}
resource "azurerm_public_ip" "publicip" {
  count = var.counting
  name                = format("publicip_count-%g", count.index+1)
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Static"
  zones = [var.zonenumber[count.index]]
  sku = "Standard"
  tags = {
    environment = format("Production-%g", count.index+1)          
  }
}
