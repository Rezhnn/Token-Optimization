param(
    [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$rootPath = (Resolve-Path -LiteralPath $Root).Path

function Read-RepoFile {
    param([string]$Path)
    return [System.IO.File]::ReadAllText((Join-Path $rootPath $Path))
}

$ignoreTemplatePath = "skills/finops-zones/templates/ignore.template"
$ignoreTemplate = Read-RepoFile $ignoreTemplatePath
$ignoreFiles = @(
    ".geminiignore",
    ".cursorignore",
    ".claudeignore",
    ".codexignore",
    ".openaiignore"
)

foreach ($ignoreFile in $ignoreFiles) {
    $content = Read-RepoFile $ignoreFile
    if ($content -ne $ignoreTemplate) {
        throw "$ignoreFile is not aligned with $ignoreTemplatePath"
    }
}

$trackedFiles = git -C $rootPath ls-files
foreach ($file in $trackedFiles) {
    if ($file -match '\.(png|jpg|jpeg|gif|webp|svg|ico|pdf|zip|woff|woff2|ttf|eot)$') {
        continue
    }

    $fullPath = Join-Path $rootPath $file
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        continue
    }

    $content = [System.IO.File]::ReadAllText($fullPath)
    if ($content -match '(?m)^<<<<<<<|^=======$|^>>>>>>>') {
        throw "Conflict marker found in $file"
    }
}

$readme = Read-RepoFile "README.md"
if ($readme -match '26\.8|84\.5|60-90|60.*90') {
    throw "README.md contains old unverified benchmark savings claims"
}

$results = Read-RepoFile "benchmarks/results/results.json" | ConvertFrom-Json
if ($results.status -ne "placeholder") {
    throw "Benchmark results must remain placeholder until an automated runner exists"
}

Write-Host "Validation passed."
