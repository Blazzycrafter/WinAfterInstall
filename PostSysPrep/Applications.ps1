write-host ""
write-host ""
write-host Installing Everything ...
write-host ""
write-host ""

winget install -e --accept-source-agreements --accept-package-agreements --silent voidtools.Everything

write-host ""
write-host ""
write-host Installing 7zip ...
write-host ""
write-host ""

winget install -e --accept-source-agreements --accept-package-agreements --silent 7zip.7zip
