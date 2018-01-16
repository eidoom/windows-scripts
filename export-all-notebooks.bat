cd C:\Programs\OneNote2PDF_0.3

set temp="C:\Programs\OneNote2PDF_0.3\temp"
set directory=C:\sync\physics\6_Part_iii\Courses

set list= GR QFT SFT SFP AQFT BH SM ST SUSY

FOR %%i in (%list%) do (
FOR %%m in ("%%i_lectures" "%%i_examples" "%%i_second") do (
OneNote2PDF -Notebook "%%~m" -CacheFolder %temp% -Output "%directory%\%%i\Exports" -ExportNotebook true -Exclude OneNote_RecycleBin
)
)