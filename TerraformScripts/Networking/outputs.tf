output "defaultNodepool_Subnet_id" {
  value = [for s in azurerm_virtual_network.virtualNetwork.subnet : s.id]
}