@echo OFF

cd C:\Programs\OneNote2PDF_0.3

set temp="C:\Programs\OneNote2PDF_0.3\temp"
set directory=C:\sync\physics\6_Part_iii\Courses

set /p course="Which subjects? [acronyms, case insensitive] "
set /p partsin="Which parts? [0=all, 1=lectures, 2=second, 3=examples] "

IF "%partsin%"=="0" (
set partsout="%%i_lectures" "%%i_examples" "%%i_second"
)
IF "%partsin%"=="1" (
set partsout="%%i_lectures"
)
IF "%partsin%"=="2" (
set partsout="%%i_second"
)
IF "%partsin%"=="3" (
set partsout="%%i_examples"
)

FOR %%i in (%course%) do (
FOR %%m in (%partsout%) do (
OneNote2PDF -Notebook "%%~m" -CacheFolder %temp% -Output "%directory%\%%i\Exports" -ExportNotebook true -Exclude OneNote_RecycleBin
)
)