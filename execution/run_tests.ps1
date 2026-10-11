# Deterministic test runner for Flutter project
param (
    [switch]$Analyze = $false
)

Write-Host "==> Running Flutter Tests..."
flutter test
if ($LASTEXITCODE -ne 0) {
    Write-Error "Flutter tests failed with exit code $LASTEXITCODE"
    exit $LASTEXITCODE
}

if ($Analyze) {
    Write-Host "==> Running Flutter Analysis..."
    flutter analyze
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Flutter analyze failed with exit code $LASTEXITCODE"
        exit $LASTEXITCODE
    }
}

Write-Host "==> All checks completed successfully."
exit 0
