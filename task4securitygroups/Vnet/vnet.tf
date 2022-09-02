
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space     = [var.cidr_block]
  location            = var.location
  resource_group_name = var.rg
  }

resource "azurerm_subnet" "vsub" {
  name                 = var.vsub
  resource_group_name  = var.rg
  virtual_network_name = var.vnet
  address_prefixes     = [var.ip_address]
  depends_on           = [azurerm_virtual_network.vnet]
}
