Import-Module activedirectory
  
$input = Import-csv -Path C:\Users\Administrator\Desktop\newusers.csv -Delimiter ";"
ForEach($user in $input){
    $uname = $user.Username
    $fname = $user.Firstname
    $lname = $user.Lastname
    $description = $user.Department
    $OU = $user.OrganizationalUnit
    $paswd = $user.password
    $act = $user.action

    if($act -eq "add"){
        New-ADUser `
        -UserPrincipalName "$uname@XGUTIERREZ.local" `
        -Name "$fname $lname" `
        -GivenName $fname `
        -Surname $lname `
        -Enabled $True `
        -DisplayName "$lname, $fname" `
        -Path $OU `
        -Description $description `
        -AccountPassword (convertto-securestring $paswd -AsPlainText -Force) -ChangePasswordAtLogon $True
    }
    elseif($act -eq "remove") {
        remove-aduser -Identity "$fname $lname"
    }
    else{
        print("No operable action!")
    }
}