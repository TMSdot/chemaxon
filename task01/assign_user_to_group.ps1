#Set Membership to Azure AD User
az ad user list
$userID = Read-Host("Add meg a felhasználó ID-ját: ")
az ad group member add --group "Test Group" --member-id $userID
