# windows_setup

Links and config files for Windows

## Choco Installation

Use this command to install choco packages from a file

```powershell
Get-Content chocolatey.txt | ForEach-Object { choco install $_ -y }
```

 Make sure to run the command with administrative privileges if required.

## Powershell Profile

Source a different path profile

```powershell
. $env:USERPROFILE\Developer\repos\windows_setup\profile.ps1
```



## WSL clipboard

```bash
cd /tmp
wget https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
unzip win32yank-x64.zip
chmod +x win32yank.exe
sudo cp win32yank.exe /usr/local/bin/
```





## Links

   [Lunarvim](https://www.lunarvim.org/)

   [WSL](https://docs.microsoft.com/pt-br/windows/wsl/install-win10)

   [Arch WSL](https://github.com/yuk7/ArchWSL)

   [Win32yank release page](https://github.com/equalsraf/win32yank/releases)  

   [Mac OS Cursor for Windows](https://github.com/antiden/macOS-cursors-for-Windows/tree/main)  

