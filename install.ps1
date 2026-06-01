# =============================================================================
# FinOps Token Optimization — install.ps1
# Installs the Zone-Based Execution Model for Windows (PowerShell)
# Usage: irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
# =============================================================================

param(
    [string]$TargetDir = "."
)

$RepoRaw = "https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main"
$ErrorActionPreference = "Stop"

function Write-Info    { param($msg) Write-Host "[finops] " -ForegroundColor Cyan -NoNewline; Write-Host $msg }
function Write-Success { param($msg) Write-Host "[finops] ✓ " -ForegroundColor Green -NoNewline; Write-Host $msg }
function Write-Warn    { param($msg) Write-Host "[finops] ⚠ " -ForegroundColor Yellow -NoNewline; Write-Host $msg }

Write-Host ""
Write-Host "  ⚡ FinOps Token Optimization — Zone-Based Execution Model" -ForegroundColor Cyan
Write-Host "  https://github.com/Rezhnn/Token-Optimization"
Write-Host ""

# --- Download ignore template ---
Write-Info "Downloading ignore boundary template..."
$ignoreTemplate = (Invoke-WebRequest -Uri "$RepoRaw/skills/finops-zones/templates/ignore.template" -UseBasicParsing).Content

# --- Write all AI ignore files (aligned) ---
$ignoreFiles = @(".geminiignore", ".cursorignore", ".claudeignore", ".codexignore", ".openaiignore")
foreach ($file in $ignoreFiles) {
    $path = Join-Path $TargetDir $file
    if (Test-Path $path) {
        Write-Warn "$file already exists — overwriting..."
    }
    $ignoreTemplate | Set-Content -Path $path -Encoding UTF8
    Write-Success "Wrote $file"
}

# --- Download protocol files ---
$protocolFiles = @(
    "HYBRID_RUNTIME_SPEC.md",
    "AGENTS.md",
    "CLAUDE.md",
    "GEMINI.md",
    ".cursorrules"
)
foreach ($file in $protocolFiles) {
    Write-Info "Downloading $file..."
    $url = "$RepoRaw/$file"
    $outPath = Join-Path $TargetDir $file
    Invoke-WebRequest -Uri $url -OutFile $outPath -UseBasicParsing
    Write-Success "Wrote $file"
}

Write-Host ""
Write-Host "  ✓ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "  Zone-Based Execution is now active in this workspace."
Write-Host "  Use [PLAN], [ARCH], [CMD], [GIT], `$ prefixes to control zones."
Write-Host "  Run '!verbose', '!fast', '!code' mid-session for overrides."
Write-Host ""
Write-Host "  Read the docs: $TargetDir\HYBRID_RUNTIME_SPEC.md"
Write-Host ""
