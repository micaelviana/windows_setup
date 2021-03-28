Set-Location D:\
Set-Variable HOME "D:\" -Force
# New-Alias open ii
Set-Alias -Name open -Value ii
Set-Alias -Name touch -Value New-Item
Set-Alias -Name grep -Value Select-String
Set-Alias -Name vi -Value nvim
# New-Alias grep Select-String


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

#Set​ the color for Prediction (auto-suggestion)
# Set-PSReadlineOption -Colors @{History = 'DarkGreen' }
