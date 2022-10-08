#Prompt
# oh-my-posh init pwsh | Invoke-Expression 
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\gruvbox.omp.json" | Invoke-Expression 
#Modules
# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -BellStyle None

# Fzf
Import-Module PSFzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

#lunarvim
if(Test-Path -Path C:\Users\Micael\.local\bin\lvim.ps1 -PathType Leaf ){
  Set-Alias lvim C:\Users\Micael\.local\bin\lvim.ps1
}

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
Set-Alias pwd normal_pwd
Set-alias vi nvim
Set-alias g git
Set-alias clipcopy clip.exe

function normal_pwd{
write-host $pwd.Path
}

#aliases to git binaries
Set-alias mkdir C:\Users\Micael\scoop\apps\git\current\usr\bin\mkdir.exe
Set-alias cat C:\Users\Micael\scoop\apps\git\current\usr\bin\cat.exe
Set-alias less C:\Users\Micael\scoop\apps\git\current\usr\bin\less.exe
Set-alias head C:\Users\Micael\scoop\apps\git\current\usr\bin\head.exe
Set-alias tail C:\Users\Micael\scoop\apps\git\current\usr\bin\tail.exe
Set-alias grep C:\Users\Micael\scoop\apps\git\current\usr\bin\grep.exe
Set-alias sed C:\Users\Micael\scoop\apps\git\current\usr\bin\sed.exe
Set-alias awk C:\Users\Micael\scoop\apps\git\current\usr\bin\gawk.exe
Set-alias touch C:\Users\Micael\scoop\apps\git\current\usr\bin\touch.exe
Set-alias find C:\Users\Micael\scoop\apps\git\current\usr\bin\find.exe
Set-alias rm C:\Users\Micael\scoop\apps\git\current\usr\bin\rm.exe
Set-alias rmdir C:\Users\Micael\scoop\apps\git\current\usr\bin\rmdir.exe
Set-alias ln C:\Users\Micael\scoop\apps\git\current\usr\bin\ln.exe
Set-alias wc C:\Users\Micael\scoop\apps\git\current\usr\bin\wc.exe

#{{Functions}}
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

#winget install from winget
function winstall($package){
    winget install $package --source winget
}
#winget install from store
function msinstall($package){
    winget install $package --source msstore
}
