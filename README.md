Running terraform code
-> Install az cli, terraform, databricks-cli (pip install databricks-cli)
-> Modify terraform.tfvars variables as required
-> AZ-CLI authentication 
            -> az login --use-device-code 
            -> https://microsoft.com/devicelogin
            -> az ad user list
-> terraform init
-> terraform apply -target=module.adb-uc-metastore -target=module.adb-lakehouse -target=adb-ws-uc-assignment -target=module.adb-uc-data-objects
-> Databricks CLI authentication
            -> databricks configure --token
            -> workspace URL
            -> Manually generated PAT token for the current user
-> terraform apply -target=module.adb-ws-configs


To destory
-> terraform destroy -target=module.adb-ws-configs -target=module.adb-uc-data-objects -target=adb-ws-uc-assignment -target=module.adb-lakehouse -target=module.adb-uc-metastore



