#Build A3 Server with PBOMANAGER

Clear-Host;

$pboManager = "S:\Programme\PboManager\PBOConsole.exe"
$Path = "P:\A3SERVER_Project\SERVER\DUCKLIFE"

Set-Alias -Name PBO -Value $pboManager

# Stop Arma 3 Server Instance(s)
Stop-Process -Name arma3server_x64 -Force -Confirm -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force C:\SHARE\A3Master -ErrorAction SilentlyContinue

Remove-Item -Path "$($Path)\A3Master\@DUCKOTH\addons\duckoth.pbo"
Remove-Item -Path "$($Path)\A3Master\@DUCK.Core\addons\duck.core.pbo"
Remove-Item -Path "$($Path)\A3Master\@DUCK.Life\addons\duck.life.pbo"

PBO -pack "$($Path)\A3Master\@DUCKOTH\addons\duckoth" "$($Path)\A3Master\@DUCKOTH\addons\duckoth.pbo"
PBO -pack "$($Path)\A3Master\@DUCK.Core\addons\duck.core" "$($Path)\A3Master\@DUCK.Core\addons\duck.core.pbo"
PBO -pack "$($Path)\A3Master\@DUCK.Life\addons\duck.life" "$($Path)\A3Master\@DUCK.Life\addons\duck.life.pbo"

$Destination = "\\Dedcli-pcdaniel\share"

Get-ChildItem -Path "$($Path)\*" | % {
  if (($_.FullName) -NotLike '*vscode*') { 
    Write-Host "Copying $($_.Fullname) to $($Destination)"
    Copy-Item $_.fullname "$Destination" -Recurse -Force -Exclude *.log
  }; 
}

Copy-Item "C:\SHARE\*" -Destination "P:\a3servertest" -Recurse -Force

P:\a3servertest\A3Master\arma3server_x64_Start.bat
