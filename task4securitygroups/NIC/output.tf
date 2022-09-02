output "nicid" {
    value = azurerm_network_interface.nic[*].id
}