@echo OFF

cd C:\Programs\OneNote2PDF_0.3

set temp="C:\Programs\OneNote2PDF_0.3\temp"
set courses=C:\sync\physics\6_Part_iii\Courses

set /p list="Which subjects? (acronyms, case insensitive) "
set /p parts1="Which parts? (0=all, 1=lectures, 2=second, 3=examples) "

IF "%parts1%"=="0" (
set parts2="%%i_lectures" "%%i_examples" "%%i_second"
)
IF "%parts1%"=="1" (
set parts2="%%i_lectures"
)
IF "%parts1%"=="2" (
set parts2="%%i_second"
)
IF "%parts1%"=="3" (
set parts2="%%i_examples"
)

FOR %%i in (%list%) do (
FOR %%m in (%parts2%) do (
OneNote2PDF -Notebook "%%~m" -CacheFolder %temp% -Output "%courses%\%%i\Exports" -ExportNotebook true -Exclude OneNote_RecycleBin
)
)