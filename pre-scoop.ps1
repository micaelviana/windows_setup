# PowerShell.exe -File <FileName> -ExecutionPolicy Bypass 

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
Invoke-RestMethod get.scoop.sh | Invoke-Expression

scoop install aria2
scoop install 7zip
scoop install git

scoop bucket add extras
scoop bucket add nerd-fonts
