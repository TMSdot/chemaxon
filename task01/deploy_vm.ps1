#Create Resource Group
az group create --name "ChemaxonTest" --location swedencentral

#Deploy VM
az vm create --resource-group "ChemaxonTest" --name "AzureVM1" --image Win2019Datacenter --assign-identity --admin-username "azureuser" --admin-password "uHVRmpJR9ocJkbAy"

#Install AzureAD extension to the VM
az vm extension set --publisher Microsoft.Azure.ActiveDirectory --name AADLoginForWindows --resource-group "ChemaxonTest" --vm-name "AzureVM1"
