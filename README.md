1. If deploying resources to new azure subscription
        - Delete current metastore  - https://accounts.azuredatabricks.net/login
        - add variables to terraform.tfvars as needed
        - modify subsciption id, tenant id on terraform.tfvars
        - Login to azure portal from codespace - az login --use-device-code - https://microsoft.com/devicelogin
        - comment out - module adb-git