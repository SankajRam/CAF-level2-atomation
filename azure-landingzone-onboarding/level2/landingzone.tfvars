landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "caf_networking_con_ENVIRONMENT"
  level               = "CURRENT_LEVEL"
  key                 = "CURRENT_LEVEL_FOLDER"
  tfstates = {
    caf_networking_con_ENVIRONMENT = { # The "Development" Vnet HUB
      level   = "current"
      tfstate = "caf_networking_con_ENVIRONMENT.tfstate"
    }
    singtel-git-core-pep-dns-sea-01 = {
      level   = "current"
      tfstate = "singtel-git-core-pep-dns-sea-01.tfstate"
    }
    singtel-git-core-dns-ENVIRONMENT-sea-01 = {
      level   = "current"
      tfstate = "singtel-git-core-dns-ENVIRONMENT-sea-01.tfstate"
    }
    singtel-git-core-apps-dns-ENVIRONMENT-sea-01 = {
      level   = "current"
      tfstate = "singtel-git-core-apps-dns-ENVIRONMENT-sea-01.tfstate"
    }
    singtel-git-core-dns-pr-ENVIRONMENT-sea-01 = {
      level = "current"
      tfstate = "singtel-git-core-dns-pr-ENVIRONMENT-sea-01.tfstate"
    }    
  }
}
