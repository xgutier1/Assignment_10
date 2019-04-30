Import-Module activedirectory
  
$input = Import-csv -Path C:\Users\Administrator\Desktop\newSGs.csv -Delimiter ";"
ForEach($group in $input){
    $name = $group.name
    $scope = $group.scope
    $category = $group.category
    $description = $group.description
    $OU = $group.OU

    New-ADGroup -Name $name -GroupScope $scope -GroupCategory $category -Description $description -Path $OU
}