$password = Read-Host -Prompt "Enter the new user's password: "
az ad user create --display-name "Teszt Elek" --password $password --user-principal-name "teszt.elek@molnartamas.eu"
