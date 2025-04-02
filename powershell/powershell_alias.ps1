# Displaying files and directories
## Powershell command
function lld { Get-ChildItem -Directory} # list directories only
function llf { Get-ChildItem -File} # list files only
function lla { Get-ChildItem -Attributes Hidden, !Hidden} # list hidden and non-hidden files

## eza command
function tree { & eza -h --icons=auto --no-permission --tree --level=$args}

# copying current folder name
function cpwd { (pwd).path | Set-Clipboard }

# copying folder path of z destinztion
function cz {
  param ([string]$dir)
  $origianlPath = Get-Location
  z $dir
  (Get-Location).Path | Set-Clipboard
  Set-Location $origianlPath
}

# Git commands
function gs { & git status }
function gch { & git checkout $args }
function gac { & git add --all ; & git commit -m $args }

# App alias
Set-Alias -Name vi -Value nvim
function ink { & inkscape $args }
function draw { & draw.io $args }

# fzf commands
# using fzf find process ID and copy to clip board
# change [5] for ID column number accordingly 
function findp { Get-Process | fzf | ForEach-Object { ($_ -split '\s+')[5].Trim() } | Set-Clipboard }
# Create stop process function
function stopp {
        param( [int]$processId )
        try {
            # Attempt to stop the process
            Stop-Process -Id $processId -Force
            Write-Host "Process $processId has been terminated." -ForegroundColor Green
        }
        catch {
            # Handle errors
            Write-Host "Failed to terminate the process: $($_.Exception.Message)" -ForegroundColor Red
        }
}

