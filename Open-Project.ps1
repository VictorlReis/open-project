# Define project paths
$projectPaths = @{
    projectExample01 = @{
        server = @{
            path = "C:\Users\youruser\projectExample01\server"
            command = "npm run start"
        }
        client = @{
            path = "C:\Users\youruser\projectExample01\client"
            command = "npm run start"
        }
        shared = @{
            path = "C:\Users\youruser\projectExample01\shared"
            command = "npm run watch-all"
        }
        default = @{
            path = "C:\Users\victo\projectExample01"
            command = $null
        }
    }
}

function Open-Project {
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$project,
        [Parameter(Mandatory=$true, Position=1)]
        [string]$subfolder,
        [switch]$r
    )

    if (-not $projectPaths.ContainsKey($project)) {
        Write-Error "Invalid project name."
        return
    }

    $subfolderPaths = $projectPaths[$project]
    $subfolderPath = $subfolderPaths[$subfolder]

    if (-not $subfolderPath) {
        Write-Error "Invalid subfolder."
        return
    }

    Set-Location $subfolderPath.path

    if ($r) {
        $command = $subfolderPath.command
        if ($command) {
            Start-Process "cmd" "/c $command"
        } else {
            Start-Process "npm" -ArgumentList "run start", "-NoExit"
        }
    }
}

Set-Alias -Name "o" -Value "Open-Project"
