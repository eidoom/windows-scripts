@ECHO off

cd C:\Programs\OneNote2PDF_0.3

set temp="C:\Programs\OneNote2PDF_0.3\temp"
set directory=C:\sync\physics\6_Part_iii\Courses

set courses= GR QFT SFT SFP AQFT BH SM ST SUSY
set groups= Lectures Examples 
set sections= 1 2

FOR %%i in (%courses%) do (
    FOR %%m in (%groups%) do (
        FOR %%n in (%sections%) do (
            OneNote2PDF -Notebook "%%i" -CacheFolder %temp% -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "%%m_%%n"
        )
    )
    OneNote2PDF -Notebook "%%i" -CacheFolder %temp% -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "Examples_class"
)
