#Prompt
# oh-my-posh init pwsh | Invoke-Expression 
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\1_shell.omp.json" | Invoke-Expression 
#Modules
# PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Import-Module -Name Terminal-Icons
# Fzf
Import-Module PSFzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-Alias lvim C:\Users\Micael\.local\bin\lvim.ps1

#Zoxide
# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})


#LSD
Set-Alias ls lsd
function ll{lsd -l}
function la{lsd -a}
function lla{lsd -la}

#Aliases
Set-alias vi nvim
Set-alias g git
Set-alias clipcopy clip.exe

function which ($command){
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


#Remove-Item doesn't delete folders by default, -Force solve the problem
function remove{
  ForEach ($filename in $args){
    Remove-Item -Force $filename
  }
}

#just works in adm mode
function link ($target, $link){
  New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function copyfile($file){
  Get-content $file | clip.exe
}

#alias ..=cd .., just like in zsh
function ..{
  Set-Location ..
}
