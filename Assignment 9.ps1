$keypath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\LM_LICENSE_FILE"
$shortkeypath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
$keyexists = (Test-Path $keypath\LM_LICENSE_FILE)

if (-Not $keyexists){
    New-Item –Path $shortkeypath –Name LM_LICENSE_FILE
  }
$valueexists = (Get-ItemProperty -Path $keypath ) -like "*27000@test.university.edu*"

if (-Not $valueexists)
    {Set-ItemProperty -Path $keypath -Name LMPath -value "27000@test.university.edu"
  }