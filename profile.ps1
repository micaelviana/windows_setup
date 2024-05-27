# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#fnm
fnm env --use-on-cd | Out-String | Invoke-Expression

#Modules
# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -BellStyle None

# Fzf
Import-Module PSFzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'


#Zoxide
# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

#LSD
Set-Alias ls lsd
function ll{lsd -l $args}
function la{lsd -a $args}
function lla{lsd -la $args}
function lt{lsd --tree $args}

#Aliases
function normal_pwd{
  Write-Host $pwd.Path
}
Set-Alias pwd normal_pwd
Set-alias vi lvim
Set-alias g git
Set-alias c clear
Set-alias clipcopy clip.exe


#aliases to git binaries
Set-alias head "C:\Program Files\Git\usr\bin\head.exe"
Set-alias tail "C:\Program Files\Git\usr\bin\tail.exe"
Set-alias grep "C:\Program Files\Git\usr\bin\grep.exe"
Set-alias sed "C:\Program Files\Git\usr\bin\sed.exe"
Set-alias awk "C:\Program Files\Git\usr\bin\gawk.exe"
Set-alias touch "C:\Program Files\Git\usr\bin\touch.exe"
Set-alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-alias find "C:\Program Files\Git\usr\bin\find.exe"
Set-alias rm "C:\Program Files\Git\usr\bin\rm.exe"
Set-alias rmdir "C:\Program Files\Git\usr\bin\rmdir.exe"
Set-alias column "C:\Program Files\Git\usr\bin\column.exe"
Set-alias ln "C:\Program Files\Git\usr\bin\ln.exe"
Set-alias unlink "C:\Program Files\Git\usr\bin\unlink.exe"
 
#{{Functions}}
function which ($command){
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function vif(){
  lvim -o $(fzf --layout=reverse --height=50% --read0 --print0 --exit-0)
}

function vid {
   lvim . 
}


function copyfile($file){
  Get-content $file | clip.exe
}

#alias ..=cd .., just like in zsh
function ..{ Set-Location ..}

#git functions
function gpu {git push origin HEAD}

function gcme($message){git commit -m "$message"}

function gau {git add -u}

function gpl {git pull}

function gs {git status}

#Starship source
Invoke-Expression (&starship init powershell)
