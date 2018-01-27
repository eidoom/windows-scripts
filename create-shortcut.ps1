$f = Read-Host -Prompt "Which file?"
$s=(New-Object -COM WScript.Shell).CreateShortcut("$HOME\scripts\$f.lnk")
$s.TargetPath="$HOME\scripts\$f.bat"
$s.Save()
