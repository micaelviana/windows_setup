#variables
# Set-Location D:\
# Set-Variable VIDIR "C:\Users\Micael\AppData\Local\nvim"

# New-Alias open ii

#aliases
Set-Alias -Name open -Value Invoke-Item
Set-Alias -Name grep -Value Select-String
Set-Alias -Name vi -Value nvim

#parameters(-Character -Word -Line)
Set-Alias -Name wc -Value Measure-Object

#functions

#git aliases
function gau{git add -u}
function gpush{git push}
function gll{git pull}
function gs{git status}

#set home directory
function setLocale {
    $current = $pwd.Path
    $system = "C:\WINDOWS\system32"

    if($current -eq $system){
        Set-Location D:\
    }
}

#pretends to be linux which
function which($name){
    Get-Command $name | Select-Object -ExpandProperty Definition
}

#pretends to be linux touch
function touch{
    ForEach ($filename in $args){
        New-Item $filename
    }
}

#Remove-Item doesn't delete folders by default, -Force solve the problem
function remove {
    ForEach ($filename in $args){
        Remove-Item -Force $filename
    }
}

#go home
function gh{
    Set-Location D:\
}

#just works in adm mode
function link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

#list choco packages
function clocal {
    choco list --local only
}

function vidir{
    Set-Location C:\Users\Micael\AppData\Local\nvim
}

#alias ..=cd .., just like in zsh
function .. {
    Set-Location ..
}

#call function 
setLocale


#Modules

Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme spaceship


# # Shows navigable menu of all options when hitting Tab
# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# # Autocompletion for arrow keys
# Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
# Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward


Import-Module PSReadLine

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

#Set??? the color for Prediction (auto-suggestion)
# Set-PSReadlineOption -Colors @{History = 'DarkGreen' }
