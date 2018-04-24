@echo OFF

echo # Notebook exporter [case insensitive input]
echo.

cd C:\Programs\OneNote2PDF_0.3

set temp=C:\Programs\OneNote2PDF_0.3\temp
set directory=C:\sync\physics\6_Part_iii\Courses

set /p coursesin="Which subjects? [acronyms; blank=all] "

if "%coursesin%"=="" (
    set coursesout=C GR QFT SFT SFP AQFT BH SM ST SUSY CQS
) else (
    set coursesout=%coursesin%
)

echo ## Courses: %coursesout%
echo.

set /p groupsin="Which groups? [blank=all, l=lectures, e=examples] "

if "%groupsin%"=="" (
    set groupsout=Lectures Examples
) else if "%groupsin%"=="l" (
    set groupsout=Lectures
) else if "%groupsin%"=="L" (
    set groupsout=Lectures
) else if "%groupsin%"=="e" (
    set groupsout=Examples
) else if "%groupsin%"=="E" (
    set groupsout=Examples
) else (
    echo No readable input!
    timeout 5
    exit /b
)

echo ## Groups: %groupsout%
echo.

set /p sectionsin="Which sections? [blank=all, c=class, 1=first, 2=second] "

if "%sectionsin%"=="" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="1" (
    set sectionsout=1
    set class=0
) else if "%sectionsin%"=="2" (
    set sectionsout=2
    set class=0
) else if "%sectionsin%"=="c" (
    set sectionsout=
    set class=1
) else if "%sectionsin%"=="C" (
    set sectionsout=
    set class=1    
) else (
    echo No readable input!
    timeout 5
    exit /b
)
if class==1 (
    classbool=yes
) else if class==0 (
    classbool=no
)

echo ## Sections: %sectionsout%
echo ## Examples class: %classbool%
echo.

for %%i in (%coursesout%) do (
    for %%m in (%groupsout%) do (
        for %%n in (%sectionsout%) do (
            echo ## %%i %%m %%n
            OneNote2PDF -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "%%i_%%m_%%n"
            echo.
        )
    )
    if not "%groupsout%"=="Lectures" (
        if %class%==1 (
            echo ## %%i Examples class
            OneNote2PDF -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "%%i_Examples_class"
            echo.
        )
    )
)

timeout 5
