@echo OFF

echo # Notebook exporter
echo.

set temp=C:\Programs\OneNote2PDF_0.3\temp
set directory=C:\Users\ryan\gdrive\PhD

echo # All notebooks:
C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -ListAllNotebook true
echo.

set notesbooksReading=calculating-scattering-amplitudes-efficiently
set notebooksTeaching=foundations-of-physics-3a-2018
set notebooksLectures=ampl astro cft cmp cos flav gr grp higgs ift npp nu qcd qed qft rg sm strings susy

for %%i in (%notesbooksReading%) do (
    echo # Exporting notebook %%i to path %directory%\Teaching\%%i
    C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\Reading\%%i" -Exclude OneNote_RecycleBin -ExportNotebook true -ShowTOC true
    echo.
)

for %%i in (%notebooksTeaching%) do (
    echo # Exporting notebook %%i to path %directory%\Teaching\%%i
    C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\Teaching\%%i" -Exclude OneNote_RecycleBin -ExportNotebook true -ShowTOC true
    echo.
)

for %%i in (%notebooksLectures%) do (
    echo # Exporting notebook %%i to path %directory%\Teaching\%%i
    C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\Lectures\%%i" -Exclude OneNote_RecycleBin -ExportNotebook true -ShowTOC true
    echo.
)

exit
