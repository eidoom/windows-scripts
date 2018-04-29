# $f = Read-Host -Prompt "Which file?"
$f = $args[0]
$s=(New-Object -COM WScript.Shell).CreateShortcut("$HOME\scripts\$f.lnk")
$s.TargetPath="$HOME\scripts\$f.bat"
$s.Save()
