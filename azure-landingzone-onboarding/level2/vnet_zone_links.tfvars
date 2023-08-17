  vnet_pvtdns_link_PROJECT_VNET_KEY = {
    vnet_key          = "VNET_KEY"
	version           = "v1"	
    private_dns_zones = {
      file_windows_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_file-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "file_windows"

      }
      automation_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_automation-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "automation"

      }
      database_windows_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_database_windows-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "database_windows"

      }
      table_windows_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_table_windows-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "table_windows"

      }
      web_windows_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_web_windows-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "web_windows"

      }
      postgres_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_postgres_azure-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "postgres_azure"
      }
      mysql_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_mysql_azure-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "mysql_azure"
      }
      mariadb_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_mariadb_azure-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "mariadb_azure"
      }
      vaultcore_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_vaultcore_azure-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "vaultcore_azure"
      }
      managedhsm_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_managedhsm_azure-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "managedhsm_azure"
      }
      azmk8s_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azmk8s_azure-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azmk8s_azure"
      }
      search_windows_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_search_windows-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "search_windows"
      }
      backup_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_backup_azure-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "backup_azure"
      }
      sql_synapse_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_sql_synapse-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "sql_synapse"
      }
      dev_synapse_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_dev_synapse-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "dev_synapse"
      }
      synapse_studio_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_synapse_studio-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "synapse_studio"
      }
      data_lake_file_sys_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_data_lake_file_sys-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "data_lake_file_sys"
      }
      cosmos_db_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_cosmos_db-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "cosmos_db"
      }
      cosmos_mongo_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_cosmos_mongo-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "cosmos_mongo"
      }
      cosmos_cassandra_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_cosmos_cassandra-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "cosmos_cassandra"
      }
      cosmos_gremlin_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_cosmos_gremlin-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "cosmos_gremlin"
      }
      cosmos_table_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_cosmos_table-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "cosmos_table"
      }
      azure_batch_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azure_batch-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azure_batch"
      }
      app_config_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_app_config-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "app_config"
      }
      site_recovery_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_site_recovery-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "site_recovery"
      }
      service_bus_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_service_bus-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "service_bus"
      }
      azure_devices_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azure_devices-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azure_devices"
      }
      azure_devices_provisioning_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azure_devices_provisioning-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azure_devices_provisioning"
      }
      blob_windows_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_blob-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "blob_windows"
      }
      queue_windows_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_queue-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "queue_windows"
      }
      azurecr_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_acr-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azurecr_azure"
      }
      backup_azure_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_backup-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "backup_azure"
      }
      azure_api_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azuere_api-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azure_api"
      }
      azuredatabricks_zone = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azuredatabricks-link-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azuredatabricks"
      }



      eventgrid = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_eventgrid-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "eventgrid"
      }
      azurewebsites = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azurewebsites-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azurewebsites"
      }
      azureml = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azureml-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "azureml"
      }
      notebooks = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_notebooks-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "notebooks"
      }
      signalr = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_signalr-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "signalr"
      }
      monitor = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_monitor-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "monitor"
      }
      oms_opinsights = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_oms_opinsights-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "oms_opinsights"
      }
      ods_opinsights = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_ods_opinsights-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "ods_opinsights"
      }
      agentsvc = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_agentsvc-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "agentsvc"
      }
      applicationinsights = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_applicationinsights-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "applicationinsights"
      }
      cognitiveservices = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_cognitiveservices-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "cognitiveservices"
      }
      openai = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_openai-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "openai"
      }
      datafactory = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_datafactory-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "datafactory"
      }
      adf = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_adf-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "adf"
      }
      redis = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_redis-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "redis"
      }
      redisenterprise = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_redisenterprise-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "redisenterprise"
      }
      purview = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_purview-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "purview"
      }
      purviewstudio = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_purviewstudio-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "purviewstudio"
      }
      digitaltwins = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_digitaltwins-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "digitaltwins"
      }

      scm_azurewebsites= {
        name   = "singtel-git-core-PROJECT_VNET_KEY_azurewebsites-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "scm_azurewebsites"
      }
      afs_azure = {
        name   = "singtel-git-core-PROJECT_VNET_KEY_asf-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "afs_azure"
      }
      kusto_azure  ={
        name   = "singtel-git-core-PROJECT_VNET_KEY_kusto_azure-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "kusto_azure"
      }

      pbi_azure  ={
        name   = "singtel-git-core-PROJECT_VNET_KEY_pbi_azure-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "pbi_azure"
      }

      powerquery_azure  ={
        name   = "singtel-git-core-PROJECT_VNET_KEY_powerquery_azure-ENV-sea-01"
        lz_key = "singtel-git-core-pep-dns-sea-01"
        key    = "powerquery_azure"
      }

      ocp_cluster01_dns_zone = {
        name = "singtel-git-core-PROJECT_VNET_KEY_ocp_cluster01-ENV-sea-01"
        id= "/subscriptions/OCPSUBID/resourceGroups/urax-rg-ti-ocp-OCPDNS-cluster01/providers/Microsoft.Network/privateDnsZones/cluster01.ocp.OCPDNS.az.sg.singtelgroup.net"
      }
      ocp_cluster02_dns_zone = {
        name = "singtel-git-core-PROJECT_VNET_KEY_ocp_cluster02-ENV-sea-01"
        id= "/subscriptions/OCPSUBID/resourceGroups/urax-rg-ti-ocp-OCPDNS-cluster02/providers/Microsoft.Network/privateDnsZones/cluster02.ocp.OCPDNS.az.sg.singtelgroup.net"
      }	  


      dns_singtelgroup_zone = {
        name                 = "singtel-git-core-dns-PROJECT_VNET_KEY-ENV-link-sea-01"
        lz_key               = "singtel-git-core-dns-SINGTELDNS-sea-01"
        key                  = "dns"
        registration_enabled = true
      }
      app_dns_singtelgroup_zone = {
        name   = "singtel-git-core-apps-dns-PROJECT_VNET_KEY-ENV-link-sea-01"
        lz_key = "singtel-git-core-apps-dns-APPDNS-sea-01"
        key    = "apps_dns"
      }
    }
  }

  #ADDVNETLINKS
