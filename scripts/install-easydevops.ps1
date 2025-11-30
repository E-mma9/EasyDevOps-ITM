# Installeer .NET SDK (nu heb jij dit al, maar voor ITM-ontwikkelaars)
winget install --id Microsoft.DotNet.SDK.8 --source winget -e

# Installeer Git
winget install --id Git.Git --source winget -e

# Clone de EasyDevOps repo
$repoUrl   = "https://github.com/E-mma9/EasyDevOps-ITM.git"
$targetDir = "$env:USERPROFILE\EasyDevOps-ITM"
git clone $repoUrl $targetDir

# Run de .NET frontend
cd "$targetDir\frontend\EasyDevOpsFrontend"
dotnet run
