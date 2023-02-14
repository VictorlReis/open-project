# Define project paths
$projectPaths = @{
    project1 = @{
        server = ""
        client = ""
        shared = ""
        default = ""
    }
    project2 = @{
        server = ""
        client = ""
        shared = ""
        default = ""
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

    Set-Location $subfolderPath

    if ($r) {
        Start-Process "npm" -ArgumentList "run start", "-NoExit"
    }
}

Set-Alias -Name "o" -Value "Open-Project"
