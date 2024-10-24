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

## Update debian from stable to sid(unstable)
After installing from the Microsoft Store, edit the file located in `/etc/apt/sources.list`.

Comment all the lines and add these two lines:
```bash
deb http://deb.debian.org/debian sid main contrib non-free
deb-src http://deb.debian.org/debian sid main contrib non-free
```

## Enable Unix-like end-of-line in the text editors

### VSCode
Hit `Ctrl+,` to acess the settings, then search for **eol** and set **\n**

### Notepad++
For any new document: Settings -> Preferences -> New Document (left pane) -> New Document (right pane) -> Format (Line ending) -> Windows (CR LF) / Unix (LF) / Macintosh (CR)

And for an already-open document: Edit -> EOL Conversion


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

