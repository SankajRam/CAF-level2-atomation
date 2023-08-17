  HUBINDEXNAME = {
    name                      = "singtel-git-core-PROJECT-con-NAMEENVIRONMENT-sea-INDEX"
    internet_security_enabled = true

    virtual_hub = {
      lz_key = "caf_networking_con_ENVIRONMENT"
      key    = "hub_ENVIRONMENT1"
    }

    vnet = {
      vnet_key = "VNETKEY"
    }

    routing = {
      route1 = {
        virtual_hub_route_table_key = "defaultRouteTable"
        propagated_route_table      = {
          labels                       = ["none"]
          virtual_hub_route_table_keys = [
            "noneRouteTable"
          ]
        }
      }
    }
  }

  #ADDHUBCONNECTIONDETAILS
