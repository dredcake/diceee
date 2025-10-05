# DICE GAME - UPLOAD PREPARATION SCRIPT

Write-Host "🎲 PREPARING DICE GAME FOR UPLOAD..." -ForegroundColor Green

# Check if exe exists on desktop
$exePath = "$env:USERPROFILE\Desktop\dice_game.exe"
if (Test-Path $exePath) {
    Write-Host "✅ Found dice_game.exe on Desktop" -ForegroundColor Green
    
    # Get file size
    $size = (Get-Item $exePath).Length / 1MB
    Write-Host "📁 File size: $([math]::Round($size, 2)) MB" -ForegroundColor Yellow
    
    # Create upload folder
    $uploadFolder = "$env:USERPROFILE\Desktop\dice_game_upload"
    if (!(Test-Path $uploadFolder)) {
        New-Item -ItemType Directory -Path $uploadFolder
        Write-Host "📁 Created upload folder: $uploadFolder" -ForegroundColor Green
    }
    
    # Copy exe to upload folder
    Copy-Item $exePath -Destination "$uploadFolder\dice_game.exe"
    Write-Host "📋 Copied exe to upload folder" -ForegroundColor Green
    
    # Create zip file
    $zipPath = "$env:USERPROFILE\Desktop\dice_game.zip"
    if (Test-Path $zipPath) { Remove-Item $zipPath }
    
    Compress-Archive -Path $uploadFolder -DestinationPath $zipPath
    Write-Host "🗜️ Created zip file: dice_game.zip" -ForegroundColor Green
    
    # Show final info
    Write-Host "`n🚀 READY FOR ITCH.IO UPLOAD!" -ForegroundColor Cyan
    Write-Host "📄 Upload file: $zipPath" -ForegroundColor White
    Write-Host "🌐 Go to: https://itch.io/game/new" -ForegroundColor White
    
} else {
    Write-Host "❌ dice_game.exe not found on Desktop!" -ForegroundColor Red
    Write-Host "⚠️ Please export from Godot first!" -ForegroundColor Yellow
    Write-Host "📖 Follow BUILD_INSTRUCTIONS.md" -ForegroundColor White
}

Write-Host "`nPress any key to continue..." -ForegroundColor Gray
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")