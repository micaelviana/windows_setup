# windows_setup

Links and config files for Windows

## Before Start
I recommend you use **Powershell Core** instead of the embedded Powershell solution to run the scripts

Open PowerShell in administrator mode by right-clicking and selecting "Run as administrator"

So put the command:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;
```

## Choco Installation

Use this command to install choco packages from a file

```powershell
Get-Content chocolatey.txt | ForEach-Object { choco install $_ -y }
```

 Make sure to run the command with administrative privileges.

## Powershell Profile

Source a different path profile

```powershell
. $env:USERPROFILE\Developer\repos\windows_setup\profile.ps1
```

## Update Debian from stable to testing

Follow the link:

[How to Switch from Debian Stable to Testing: A Step-by-Step Guide](https://linuxiac.com/how-to-switch-from-debian-stable-to-testing/)

## Enable Unix-like end-of-line in the text editors

### VSCode

Hit `Ctrl+,` to acess the settings, then search for **eol** and set **\n**

### Notepad++

For any new document: Settings -> Preferences -> New Document (left pane) -> New Document (right pane) -> Format (Line ending) -> Windows (CR LF) / Unix (LF) / Macintosh (CR)

And for an already-open document: Edit -> EOL Conversion

## WSL clipboard

### Option 1

WSL supports Wayland, so if you install the Wayland clipboard utility your Neovim installation should work fine

`sudo apt install wl-clipboard`

or

`sudo pacman -S wl-clipboard`

And inside the Neovim config:

```lua
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
```

### Option 2

If the previous recommendation didn't work try using Win32yank

```bash
cd /tmp
wget https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
unzip win32yank-x64.zip
chmod +x win32yank.exe
sudo cp win32yank.exe /usr/local/bin/
```

And inside the Neovim config:

```lua
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'win32yank-wsl',
        copy = {
            ['+'] =  'win32yank.exe -i --crlf',
            ['*'] =  'win32yank.exe -i --crlf',
        },
        paste = {
            ['+'] = 'win32yank.exe -o --lf',
            ['*'] = 'win32yank.exe -o --lf',
        },
        cache_enabled = true,
    }
end
```

## Links

   [Lunarvim](https://www.lunarvim.org/)

   [WSL](https://docs.microsoft.com/pt-br/windows/wsl/install-win10)

   [Arch WSL](https://github.com/yuk7/ArchWSL)

   [Win32yank release page](https://github.com/equalsraf/win32yank/releases)  

   [Mac OS Cursor for Windows](https://github.com/antiden/macOS-cursors-for-Windows/tree/main)  
