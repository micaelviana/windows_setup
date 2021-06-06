# powershell -executionpolicy bypass -File C:\Users\mypath\install.ps1 
# apps that have context menu that i domt want: format factory,git,vscode,vlc, 
$Packages = '7zip',
'ccleaner',
'driverbooster',
'googlechrome',
'microsoft-windows-terminal',
'neovim',
'nodejs.install',
'qbittorrent',
'quicklook',
'virtualbox'
            

  # InstallChoco
  # DoYourPackageInstallStuff
ForEach ($PackageName in $Packages){
	choco install $PackageName -y
}
