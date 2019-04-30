Import-Module activedirectory
  
$input = Import-csv -Path C:\Users\Administrator\Desktop\SGmodify.csv -Delimiter ";"
ForEach($group in $input){
    $name = $group.GroupName
    $fname = $group.Firstname
    $lname = $group.Lastname
    $act = $group.Action

    if($act -eq "add"){
        Add-ADGroupMember -Identity $name -Members "$fname $lname"
        }
        elseif($act -eq "remove"){
            Remove-ADGroupMember -Identity $name -Members "CN=$uname,OU=EnterpriseOU,DC=XGutierrez,DC=local"
            }
    else{
    print("no operable action")
    }
}