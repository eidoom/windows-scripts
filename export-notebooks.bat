@echo OFF

echo # Notebook exporter [case insensitive input, separate arguments by a space]
echo.

set temp=C:\Programs\OneNote2PDF_0.3\temp
set directory=C:\sync\physics\6_Part_iii\Courses

if %1.==. (
    set /p coursesin="Which subjects? [acronyms; blank=all] "
) else (
    set coursesin=%~1
)

if "%coursesin%"=="" (
    set coursesout=C GR QFT SFT SFP AQFT BH SM ST SUSY CQS
) else (
    set coursesout=%coursesin%
)    

echo ## Courses: %coursesout%
echo.

if %2.==. (
    set /p groupsin="Which groups? [blank=all, l=lectures, e=examples] "
) else (
    set groupsin=%~2
)

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
) else if "%groupsin%"=="l e" (
    set groupsout=Lectures Examples
) else if "%groupsin%"=="L E" (
    set groupsout=Lectures Examples
) else if "%groupsin%"=="L e" (
    set groupsout=Lectures Examples
) else if "%groupsin%"=="l E" (
    set groupsout=Lectures Examples
) else if "%groupsin%"=="e l" (
    set groupsout=Lectures Examples
) else if "%groupsin%"=="E L" (
    set groupsout=Lectures Examples
) else if "%groupsin%"=="e L" (
    set groupsout=Lectures Examples
) else if "%groupsin%"=="E l" (
    set groupsout=Lectures Examples
) else (
    echo No readable input!
    timeout 5
    exit /b
)

echo ## Groups: %groupsout%
echo.

if %3.==. (
    set /p sectionsin="Which sections? [blank=all, c=class, 1=first, 2=second] "
) else (
    set sectionsin=%~3
)

if "%sectionsin%"=="" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="1" (
    set sectionsout=1
    set class=0
) else if "%sectionsin%"=="2" (
    set sectionsout=2
    set class=0
) else if "%sectionsin%"=="1 2" (
    set sectionsout=1 2
    set class=0
) else if "%sectionsin%"=="2 1" (
    set sectionsout=1 2
    set class=0
) else if "%sectionsin%"=="1 2 c" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="2 1 c" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="1 2 C" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="2 1 C" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="1 c 2" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="2 c 1" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="1 C 2" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="2 C 1" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="c 1 2" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="c 2 1" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="C 1 2" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="C 2 1" (
    set sectionsout=1 2
    set class=1
) else if "%sectionsin%"=="1 c" (
    set sectionsout=1
    set class=1
) else if "%sectionsin%"=="2 c" (
    set sectionsout=2
    set class=1
) else if "%sectionsin%"=="1 c" (
    set sectionsout=1
    set class=1
) else if "%sectionsin%"=="2 c" (
    set sectionsout=2
    set class=1
) else if "%sectionsin%"=="1 C" (
    set sectionsout=1
    set class=1
) else if "%sectionsin%"=="2 C" (
    set sectionsout=2
    set class=1
) else if "%sectionsin%"=="1 C" (
    set sectionsout=1
    set class=1
) else if "%sectionsin%"=="2 C" (
    set sectionsout=2
    set class=1
) else if "%sectionsin%"=="c 1" (
    set sectionsout=1
    set class=1
) else if "%sectionsin%"=="c 2" (
    set sectionsout=2
    set class=1
) else if "%sectionsin%"=="c 1" (
    set sectionsout=1
    set class=1
) else if "%sectionsin%"=="c 2" (
    set sectionsout=2
    set class=1
) else if "%sectionsin%"=="C 1" (
    set sectionsout=1
    set class=1
) else if "%sectionsin%"=="C 2" (
    set sectionsout=2
    set class=1
) else if "%sectionsin%"=="C 1" (
    set sectionsout=1
    set class=1
) else if "%sectionsin%"=="C 2" (
    set sectionsout=2
    set class=1
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

if %class%==1 (
    echo hi
    set classbool=yes
) else if %class%==0 (
    set classbool=no
)

echo ## Sections: %sectionsout%
echo ## Examples class: %classbool%
echo.

for %%i in (%coursesout%) do (
    for %%m in (%groupsout%) do (
        for %%n in (%sectionsout%) do (
            echo ## %%i %%m %%n
            C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "%%i_%%m_%%n"
            echo.
        )
    )
    if not "%groupsout%"=="Lectures" (
        if %class%==1 (
            echo ## %%i Examples class
            C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "%%i_Examples_class"
            echo.
        )
    )
)

timeout 5
