clear

        # Check if winget is installed
        Write-Host "Checking if Winget is Installed..."
        if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe) {
            #Checks if winget executable exists and if the Windows Version is 1809 or higher
            Write-Host "Winget Already Installed"
        }
        else {
            #Gets the computer's information
            $ComputerInfo = Get-ComputerInfo

            #Gets the Windows Edition
            $OSName = if ($ComputerInfo.OSName) {
                $ComputerInfo.OSName
            }else {
                $ComputerInfo.WindowsProductName
            }

            if (((($OSName.IndexOf("LTSC")) -ne -1) -or ($OSName.IndexOf("Server") -ne -1)) -and (($ComputerInfo.WindowsVersion) -ge "1809")) {
                
                Write-Host "Running Alternative Installer for LTSC/Server Editions"

                # Switching to winget-install from PSGallery from asheroto
                # Source: https://github.com/asheroto/winget-installer
                
                Start-Process powershell.exe -Verb RunAs -ArgumentList "-command irm https://raw.githubusercontent.com/ChrisTitusTech/winutil/$BranchToUse/winget.ps1 | iex | Out-Host" -WindowStyle Normal
                
            }
            elseif (((Get-ComputerInfo).WindowsVersion) -lt "1809") {
                #Checks if Windows Version is too old for winget
                Write-Host "Winget is not supported on this version of Windows (Pre-1809)"
            }
            else {
                #Installing Winget from the Microsoft Store
                Write-Host "Winget not found, installing it now."
                Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
                $nid = (Get-Process AppInstaller).Id
                Wait-Process -Id $nid
                Write-Host "Winget Installed"
            }
        }

sleep 5
mkdir "C:\PostSysPrep"
cd "C:\PostSysPrep"

irm https://raw.githubusercontent.com/Blazzycrafter/WinAfterInstall/main/PostSysPrep/req.ps1 -OutFile "req.ps1"
irm https://raw.githubusercontent.com/Blazzycrafter/WinAfterInstall/main/PostSysPrep/Redist.ps1 -OutFile "Redist.ps1"
irm https://raw.githubusercontent.com/Blazzycrafter/WinAfterInstall/main/PostSysPrep/DotNet.ps1 -OutFile "DotNet.ps1"
irm https://raw.githubusercontent.com/Blazzycrafter/WinAfterInstall/main/PostSysPrep/Applications.ps1 -OutFile "Applications.ps1"

Write-Host "installing Requirements..."
sleep 1
.\req.ps1
sleep 5
clear
Write-Host "installing Requirements...DONE"
sleep 2
Write-Host "installing applications..."

sleep 5

.\Applications.ps1

clear
Write-Host "installing Requirements...DONE"
Write-Host "installing Applications...DONE"
sleep 2





Write-Warning "Der Nutzer ChrisTitusTech hat eine toolbox erstellt um gewisse programme zu installieren oder tweaks auszufuehren"
Write-Warning "wir biesten ihnen hier an das tool direkt zu starten..."
Write-Warning "Sobald das tool beendet ist lassen wir den rest installieren"


$confirmation = Read-Host "Möchten Sie fortfahren? (j/N)"
if ($confirmation -eq "j") {
    irm christitus.com/win | iex
}
