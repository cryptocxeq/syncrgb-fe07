param(
  [Parameter(Mandatory = $false)]
  [ValidateSet("Debug","Release")]
  [string]$Configuration = "Release"
)

$ErrorActionPreference = "Stop"

if (-not $env:QTDIR) {
  throw "QTDIR is not set. Example: setx QTDIR C:\Qt\6.6.2\msvc2019_64"
}

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$sw = Join-Path $repoRoot "Software"

Push-Location $sw
try {
  & cmd /c "scripts\\win32\\generate_sln.bat" | Write-Host
  & MSBuild.exe "Lightpack.sln" "/p:Configuration=$Configuration" | Write-Host
} finally {
  Pop-Location
}
