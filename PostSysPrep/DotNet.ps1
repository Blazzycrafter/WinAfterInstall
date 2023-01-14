write-host ""
write-host ""
write-host Installing DotNet 3.1 ...
write-host ""
write-host ""
winget install -e --accept-source-agreements --accept-package-agreements --silent Microsoft.DotNet.DesktopRuntime.3_1; 
write-host ""
write-host ""
write-host Installing DotNet 5.0 ...
write-host ""
write-host ""
winget install -e --accept-source-agreements --accept-package-agreements --silent Microsoft.DotNet.DesktopRuntime.5
write-host ""
write-host ""
write-host Installing DotNet 6.0 ...
write-host ""
write-host ""
winget install -e --accept-source-agreements --accept-package-agreements --silent Microsoft.DotNet.DesktopRuntime.6
write-host ""
write-host ""
write-host Installing DotNet 7.0 ...
write-host ""
write-host ""
winget install -e --accept-source-agreements --accept-package-agreements --silent Microsoft.DotNet.DesktopRuntime.7