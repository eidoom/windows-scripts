@ECHO off

cd C:\Users\ryan\scripts

:reset
set /p file="Which file? [do not use file suffixes] "

if exist %file%.lnk (
    set /p replace="Link already exists! Do you want to replace it? [y=yes, else=no] "
) else (
    set replace=y
)

if not %replace%==y (
    goto reset
)

if not exist %file%.bat (
    set /p proceed="That batch file does not exist! Do you want to proceed? [y=yes, else=no] "
) else (
    set proceed=y
)

if not %proceed%==y (
    goto reset
)

powershell C:\Users\ryan\scripts\create-shortcut.ps1 %file%

bash /home/ryan/scripts/add-shortcut %file%
