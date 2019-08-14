@echo OFF

echo # Notebook exporter
echo.

set temp=C:\Programs\OneNote2PDF_0.3\temp
set directory=C:\Users\ryan\gdrive-durham\PhD\Work

set notesbooksCurrent=njet

for %%i in (%notesbooksCurrent%) do (
    echo # Exporting notebook %%i to path %directory%
    C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%" -Exclude OneNote_RecycleBin -ExportNotebook true -ShowTOC true
    echo.
)

set notesbooksCurrent2=BUSSTEPP
set directory2=C:\Users\ryan\gdrive-durham\PhD\Conferences\BUSSTEPP-2019

for %%i in (%notesbooksCurrent2%) do (
    echo # Exporting notebook %%i to path %directory%
    C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory2%" -Exclude OneNote_RecycleBin -ExportNotebook true -ShowTOC true
    echo.
)
