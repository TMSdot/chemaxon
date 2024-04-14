$password = Read-Host -Prompt "Enter the new user's password: "
az ad user create --display-name "Teszt Elek" --password $password --user-principal-name "teszt.elek@molnartamas.eu"
az ad group create --display-name "Test Group" --mail-nickname "Group"
az ad user list | 
$userID = Read-Host("Add meg a felhasználó ID-ját: ")
az ad group member add --group "Test Group" --member-id $userID

az group create --name "ChemaxonTest" --location swedencentral
az vm create --resource-group "ChemaxonTest" --name "AzureVM1" --image Win2019Datacenter --assign-identity --admin-username "azureuser" --admin-password "GNN5=#-@-5qt3gan"
az vm extension set --publisher Microsoft.Azure.ActiveDirectory --name AADLoginForWindows --resource-group "ChemaxonTest" --vm-name "AzureVM1"

az ad ds create --domain "molnartamas.eu" --replica-sets location="Sweden Central" subnet-id="/subscriptions/5ea75ac9-5774-4727-8948-7baa901b65fe" --name "molnartamas.eu" --resource-group "ChemaxonTest"
