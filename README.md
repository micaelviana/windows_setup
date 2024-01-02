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
. $env:USERPROFILE\repos\windows_setup\profile.ps1
```

## Links

   [Lunarvim](https://www.lunarvim.org/)

   [WSL](https://docs.microsoft.com/pt-br/windows/wsl/install-win10)

   [Arch WSL](https://github.com/yuk7/ArchWSL)

   [Wsl Clipboard](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)

   [Win32yank release page](https://github.com/equalsraf/win32yank/releases)  

