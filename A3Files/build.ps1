#Build A3 Server with PBOMANAGER

Clear-Host;

$pboManager = "S:\Programme\PboManager\PBOConsole.exe"

Set-Alias -Name PBO -Value $pboManager

# Stop Arma 3 Server Instance(s)
Stop-Process -Name arma3server_x64 -Force -Confirm -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force C:\SHARE\A3Master

Remove-Item -Path "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCKOTH\addons\duckoth.pbo"
Remove-Item -Path "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCK.Core\addons\duck.core.pbo"
Remove-Item -Path "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCK.Life\addons\duck.life.pbo"

PBO -pack "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCKOTH\addons\duckoth" "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCKOTH\addons\duckoth.pbo"
PBO -pack "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCK.Core\addons\duck.core" "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCK.Core\addons\duck.core.pbo"
PBO -pack "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCK.Life\addons\duck.life" "P:\A3SERVER_Project\SERVER\KOTH\A3Master\@DUCK.Life\addons\duck.life.pbo"


$Source = "P:\A3SERVER_Project\SERVER\KOTH"
$Destination = "\\Dedcli-pcdaniel\share"


Get-ChildItem -Path "$($Source)\*" | ForEach-Object {
  
  
  if (($_.FullName) -NotLike '*vscode*') { 

    Write-Host "Copying $($_.Fullname) to $($Destination)"
    Copy-Item $_.fullname "$Destination" -Recurse -Force -Exclude *.log

  }; 
}

Copy-Item "C:\SHARE\*" -Destination "P:\a3servertest" -Recurse -Force

P:\a3servertest\A3Master\arma3server_x64_Start.bat
