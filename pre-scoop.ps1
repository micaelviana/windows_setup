# PowerShell.exe -File <FileName> -ExecutionPolicy Bypass 

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex

scoop install aria2c
scoop install 7zip
scoop install git

scoop bucket add extras
