Write-Host "`Trying to set Visual Studio 2017 Professional variables." -ForegroundColor Yellow
Write-Host "`Please update path in VsDevEnv.ps1 to match VS version if this fails." -ForegroundColor Yellow

pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools"
cmd /c "VsDevCmd.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
popd

Write-Host "`Variables set." -ForegroundColor Yellow
