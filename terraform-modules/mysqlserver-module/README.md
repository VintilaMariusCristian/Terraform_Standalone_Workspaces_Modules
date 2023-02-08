**"mysqlserver-module"** contains the following resources:

- Azure mysql servers with the following configuration:
      - sku_name   = "B_Gen5_1"
      - storage_mb = 5120
      - version    = "5.7"
      - auto_grow_enabled                 = false
      - backup_retention_days             = 7
      - geo_redundant_backup_enabled      = false
      - infrastructure_encryption_enabled = false
      - public_network_access_enabled     = true
      - ssl_enforcement_enabled           = true
      - ssl_minimal_tls_version_enforced  = "TLS1_2"


- One Azure mysql database
- One Azurerm mysql firewall rule

**This module needs as prerequisites an already created Resource Group.**

The following variables are mandatory to be filled in for **"mysqlserver-module"** module:

    source = "<path to module>"
    resource_group_name = "<name of the Resource group>"

    //Mysql server vars

    mysql_server_name = "<mysql server resource name>"
    mysql_admin_username = "<mysql server admin username>"
    mysql_admin_password = "<mysql server admin password>"

    //Mysql database vars
    mysql_db_name = "<mysql db resource name>"
    
    //Firewall Rule 
    mysql_start_ip = "<the start range for ip address - i.e. my public ip address>"
    mysql_end_ip = "<the end range for ip address - i.e. my public ip address>"
    fw_name = "<firewall rule resource name>"

