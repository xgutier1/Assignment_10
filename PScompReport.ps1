#Stackoverflow to the rescue: https://stackoverflow.com/questions/44848984/create-pivot-table-from-data-in-csv-using-powershell

Install-Module ImportExcel -scope CurrentUser

$computers = Get-ADComputer -Filter * -Properties * | select Name,whenCreated,whenChanged,DistinguishedName
#more stackoverflow: https://stackoverflow.com/questions/17022017/add-column-to-csv-windows-powershell
foreach($row in $computers){
    $PC = $row.Name
    if(Test-Connection -Quiet $PC){
        $status = "Active"
    }
    else{
        $status = "Inactive"
    }
    $CompsWthStat = $computers | Select-Object *,@{Name='Status';Expression={$status}}
}
$CompsWthStat | Export-Csv "C:\Users\Administrator\Desktop\computers.csv"
$CompsWthStat |
    Export-Excel "C:\Users\Administrator\Desktop\computers.xlsx" `
        -Show `
        -IncludePivotTable `
        -PivotRows Status `
        -PivotData @{Status='count'}