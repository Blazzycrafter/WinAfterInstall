clear


cd C:\PostSysPrep
Write-host "Installing ALL DotNet Desktop Runtimes ..."

sleep 10

.\DotNet.ps1

clear

Write-host "Installing ALL DotNet Desktop Runtimes ...DONE"
sleep 1
Write-host "Installing ALL Redistributables ..."

sleep 10

.\Redist.ps1

clear
Write-host "Installing ALL DotNet Desktop Runtimes ...DONE"
Write-host "Installing ALL Redistributables ...DONE"