# powershell -executionpolicy bypass -File C:\Users\mypath\install.ps1 
# apps that have context menu that i domt want: sublime,vscode,vlc, format factory, git
#better version of Kate Editor is from Microsoft Store
#comment 
$Packages = '7zip',
    'adobereader',
    'ccleaner',
    'driverbooster',
    'formatfactory',
    'googlechrome',
    'make',
    'microsoft-windows-terminal',
    'neovim',
    'nodejs.install',
    'qbittorrent',
    'virtualbox',
    'wps-office-free'
            

  # InstallChoco
  # DoYourPackageInstallStuff
  ForEach ($PackageName in $Packages)
    {
        choco install $PackageName -y
    }
