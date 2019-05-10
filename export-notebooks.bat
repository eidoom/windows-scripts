@echo OFF

echo # Notebook exporter
echo.

set temp=C:\Programs\OneNote2PDF_0.3\temp
set directory=C:\Users\ryan\gdrive-durham\PhD

echo # All notebooks:
C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -ListAllNotebook true
echo.

if %1.==. (
    echo Tell me what you want to do!
    exit
)

if %1==Reading (
    set notesbooksReading=qcd-in-electron-positron-annihilation
    rem colour-bases calculating-scattering-amplitudes-efficiently
) else (
    set notesbooksReading=
)

if %1==Teaching (
    set notebooksTeaching=foundations-of-physics-3a-2018-npp
) else (
    set notebooksTeaching=
)

if %1==Lectures (
    set notebooksLectures=
) else (
    set notebooksLectures=
)
rem ampl astro cft cmp cos flav gr grp higgs ift npp nu qcd qed qft rg sm strings susy

for %%i in (%notesbooksReading%) do (
    echo # Exporting notebook %%i to path %directory%\Reading\%%i
    C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\Reading\%%i" -Exclude OneNote_RecycleBin -ExportNotebook true -ShowTOC true
    echo.
)

for %%i in (%notebooksTeaching%) do (
    echo # Exporting notebook %%i to path %directory%\Teaching\foundations-of-physics-3a-2018\npp
    C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\Teaching\foundations-of-physics-3a-2018\npp" -Exclude OneNote_RecycleBin -ExportNotebook true -ShowTOC true
    echo.
)

for %%i in (%notebooksLectures%) do (
    echo # Exporting notebook %%i to path %directory%\Lectures\%%i
    C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\Lectures\%%i" -Exclude OneNote_RecycleBin -ExportNotebook true -ShowTOC true
    echo.
)
