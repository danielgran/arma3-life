# Build A3 Server with PBOManager
Clear-Host;

$PBOManagerExecutable = "S:\Programme\PBOManagerExecutable\PBOConsole.exe"
$sourceCodePath = "P:\A3SERVER_Project\SERVER\DUCKLIFE"
$Destination = "\\Dedcli-pcdaniel\share"

$serverPath = "P:\a3servertest"


Set-Alias -Name PBO -Value $PBOManagerExecutable

# Stop Arma 3 Server Instance(s)
Stop-Process -Name arma3server_x64 -Force -Confirm -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force C:\SHARE\A3Master -ErrorAction SilentlyContinue

Remove-Item -Path "$($sourceCodePath)\A3Master\@DUCKOTH\addons\duckoth.pbo"
Remove-Item -Path "$($sourceCodePath)\A3Master\@DUCK.Core\addons\duck.core.pbo"
Remove-Item -Path "$($sourceCodePath)\A3Master\@DUCK.Life\addons\duck.life.pbo"

PBO -pack "$($sourceCodePath)\A3Master\@DUCKOTH\addons\duckoth" "$($sourceCodePath)\A3Master\@DUCKOTH\addons\duckoth.pbo"
PBO -pack "$($sourceCodePath)\A3Master\@DUCK.Core\addons\duck.core" "$($sourceCodePath)\A3Master\@DUCK.Core\addons\duck.core.pbo"
PBO -pack "$($sourceCodePath)\A3Master\@DUCK.Life\addons\duck.life" "$($sourceCodePath)\A3Master\@DUCK.Life\addons\duck.life.pbo"


Get-ChildItem -Path "$($sourceCodePath)\*" | % {
  if (($_.FullName) -NotLike '*vscode*') { 
    Write-Host "Copying $($_.Fullname) to $($Destination)"
    Copy-Item $_.fullname "$Destination" -Recurse -Force -Exclude *.log
  }; 
}

Copy-Item "C:\SHARE\*" -Destination $serverPath -Recurse -Force


P:\a3servertest\A3Master\arma3server_x64_Start.bat
