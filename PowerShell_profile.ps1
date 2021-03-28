#Starting directory
Set-Location D:\
Set-Variable HOME "D:\" -Force

#aliases
Set-Alias -Name open -Value ii
Set-Alias -Name grep -Value Select-String
Set-Alias -Name vi -Value nvim
# New-Alias grep Select-String

#Customization
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme spaceship

#Functions
function which($name){
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function touch{
    ForEach ($filename in $args){
        New-Item $filename
    }
}

function remove {
    ForEach ($filename in $args){
        Remove-Item $filename
    }
}


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

#Set​ the color for Prediction (auto-suggestion)
# Set-PSReadlineOption -Colors @{History = 'DarkGreen' }
