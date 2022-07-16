#Prompt
# oh-my-posh init pwsh | Invoke-Expression 
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\hunk.omp.json" | Invoke-Expression 
#Modules
# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Import-Module -Name Terminal-Icons
# Fzf
Import-Module PSFzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-Alias lvim C:\Users\Micael\.local\bin\lvim.ps1


#Aliases
Set-alias l ls
Set-alias ll ls
Set-alias vi nvim
Set-alias g git
Set-alias clipcopy clip.exe

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


#Remove-Item doesn't delete folders by default, -Force solve the problem
function remove {
    ForEach ($filename in $args){
        Remove-Item -Force $filename
    }
}

#just works in adm mode
function link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function copyfile($file){
    cat $file | clip.exe
}

#alias ..=cd .., just like in zsh
function .. {
    Set-Location ..
}
