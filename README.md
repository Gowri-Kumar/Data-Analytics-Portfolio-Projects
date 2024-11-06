Running terraform code

PRE-REQUISITE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-> Install az cli, terraform, databricks-cli (pip install databricks-cli)
-> when using a new email and deploying resources for first time, change tenant id, subscription id and adb account id in tfvars file. 
-> Modify other parts of terraform.tfvars variables as required
-> AZ-CLI authentication 
            -> az login --use-device-code 
            -> https://microsoft.com/devicelogin
            -> az ad user list
            -> or az login --use-device-code --scope 2ff814a6-3304-4ab8-85cb-cd0e6f879c1d/.default   -> Azure databricks service principal's applicaiton ID
            -> sign in with guest email id - *m#EXT#@kuttyraju1944gmail.onmicrosoft.com
-> terraform init

TF APPLY >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-> Comment workspace object modules
-> Ensure no metastore is created

-> timestamp=$(date +"%Y%m%d_%H%M") && terraform apply -auto-approve > "tf_logs/terraform_apply_$timestamp.log" 2>&1
                                 tail -f ""


-> Databricks CLI authentication
            -> databricks configure --token
            -> workspace URL
            -> Manually generated PAT token for the current user

-> Uncomment workspace object modules

-> timestamp=$(date +"%Y%m%d_%H%M") && terraform apply -auto-approve > "tf_logs/terraform_apply_$timestamp.log" 2>&1
                                 tail -f ""



TF DESTROY >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
To destory
-> terraform destroy -target=module.adb-ws-configs -target=module.adb-uc-data-objects 
-> terraform destroy -target=adb-ws-uc-assignment -target=module.adb-lakehouse -target=module.adb-uc-metastore
-> timestamp=$(date +"%Y%m%d_%H%M") && terraform destroy -auto-approve > "tf_logs/terraform_destroy_$timestamp.log" 2>&1 
                                tail -f ""
-> Delete the metastore manually

