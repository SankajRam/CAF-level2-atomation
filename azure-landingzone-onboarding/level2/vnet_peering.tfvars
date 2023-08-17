FROMVNETKEY_TO_TOVNETKEY = {
  name = "FROMVNETKEY_TO_TOVNETKEY"
  from = {
    vnet_key = "FROMVNETKEY"
  }
  to = {
    vnet_key = "TOVNETKEY"
  }
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
TOVNETKEY_TO_FROMVNETKEY = {
  name = "FROMVNETKEY_TO_TOVNETKEY"
  from = {
    vnet_key = "TOVNETKEY"
  }
  to = {
    vnet_key = "FROMVNETKEY"
  }
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

#ADDVNETPEERING