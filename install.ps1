# powershell -executionpolicy bypass -File C:\Users\mypath\install.ps1 
$Packages = '7zip',
            'adobereader',
            'ccleaner',
            'driverbooster',
            'formatfactory',
            'git',
            'googlechrome',
            'microsoft-windows-terminal',
            'neovim',
            'nodejs.install',
            'qbittorrent',
            'virtualbox',
            'vlc',
            'wps-office-free'
            

  # InstallChoco
  # DoYourPackageInstallStuff
  ForEach ($PackageName in $Packages)
    {
        choco install $PackageName -y
    }
