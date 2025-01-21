resource "azurerm_network_security_group" "securityGpInbound" {
  name                = var.securityGroupName
  location            = var.infraLocation
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allowOnlySecureinbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.environment_tag
  }
}

resource "azurerm_virtual_network" "virtualNetwork" {
  name                = var.virtualNetworkName
  location            = var.infraLocation
  resource_group_name = var.resource_group_name
  address_space       = var.virtualNetworkCIDR_Range

  subnet {
    name             = "default"
    address_prefixes = var.defaultSubnetCIDR_Range
    security_group   = azurerm_network_security_group.securityGpInbound.id
  }

  tags = {
    environment = var.environment_tag
  }
}

# resource "azurerm_subnet" "userNodePoolSubnets" {
#   count = var.usernodepoolCount
#   address_prefixes = var.userNodePoolSubnetCIDR_Range[count.index]
#   name = "${var.userNodePoolSubnetName}-${count.index}"
#   virtual_network_name = azurerm_virtual_network.virtualNetwork.name
#   resource_group_name= var.resource_group_name
# }
