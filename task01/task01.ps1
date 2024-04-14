$tenantID = Read-Host -Prompt "Enter your Tenant ID: "
Connect-AzureAD -TenantId $tenantID

function Create_User {
    Write-Host "--------------User Creator--------------"
    $displayName = Read-Host -Prompt "Enter the display name: "
    $password = Read-Host -Prompt "Enter the new user's password: "
    get-azureaddomain
    $userPrincipalName = Read-Host -Prompt "Enter the new user's Principal Name (usermail@azureaddomain.xyz (you can choose it from the list above.)): "
    $mailNickName = Read-Host -Prompt "Enter the new user's Nick Name: "
    $PasswordProfile = New-Object -Type Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.password = $password
    New-AzureADUser -DisplayName $displayName -PasswordProfile $PasswordProfile -UserPrincipalName $userPrincipalName -AccountEnabled $true -MailNickName $mailNickName
}

function Create_Group {
    Write-Host "--------------Group Creator--------------"
    $groupNameCreate = Read-Host -Prompt "Enter the new Group's name: "
    New-AzureADGroup -DisplayName $groupNameCreate -MailEnabled $false -SecurityEnabled $true -MailNickName "NotSet"
}

function Assign_AD_User_To_Group{
    Write-Host "--------------MemberShip Manager--------------"
    Get-AzureADGroup
    $groupNameAssign = Read-Host -Prompt "Select the group ObjectID from the list above: "
    Get-AzureADUser
    $userNameAssign = Read-Host -Prompt "Select the user ObjectID from the list above: "
    Add-AzureADGroupMember -ObjectId $groupNameAssign -RefObjectId $userNameAssign
}

function Deploy_Windows_VM{
    
}

function Task_Selector{
    Write-Host "Available Tasks:"
    Write-Host "1) Create AzureAD User"
    Write-Host "2) Create AzureAD Group"
    Write-Host "3) Group Membership Assign"
    $taskID = Read-Host -Prompt "Enter the task ID: "
    switch ( $taskID ) {
        1 { Create_User }
        2 { Create_Group }
        3 { Assign_AD_User_To_Group }
    }
}

Task_Selector
