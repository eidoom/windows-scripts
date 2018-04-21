@ECHO off

cd C:\Programs\OneNote2PDF_0.3

set temp="C:\Programs\OneNote2PDF_0.3\temp"
set directory=C:\sync\physics\6_Part_iii\Courses

set courses= CQS SUSY

FOR %%i in (%courses%) do (
    OneNote2PDF -Notebook "%%i" -CacheFolder %temp% -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "Lectures_1"
)
