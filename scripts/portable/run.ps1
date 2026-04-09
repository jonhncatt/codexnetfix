$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$env:CODEX_HOME = Join-Path $scriptDir ".codex-home"
$env:PATH = "$scriptDir;$env:PATH"

New-Item -ItemType Directory -Force -Path $env:CODEX_HOME | Out-Null

$companyEnv = Join-Path $scriptDir "company-env.ps1"
if (Test-Path $companyEnv) {
    . $companyEnv
}

& (Join-Path $scriptDir "codex.exe") @args
exit $LASTEXITCODE
