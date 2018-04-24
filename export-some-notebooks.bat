@echo OFF

cd C:\Programs\OneNote2PDF_0.3

set temp="C:\Programs\OneNote2PDF_0.3\temp"
set directory=C:\sync\physics\6_Part_iii\Courses

set /p courses="Which subjects? [acronyms, case insensitive] "
set /p groupsin="Which groups? [a=all, l=lectures, e=examples] "
set /p sectionsin="Which sections? [a=all, c=class, 1=first, 2=second, etc] "

IF "%groupsin%"=="a" (
    set groupsout=Lectures Examples
)
IF "%groupsin%"=="l" (
    set groupsout=Lectures
)
IF "%groupsin%"=="e" (
    set groupsout=Examples
)

IF "%sectionsin%"=="a" (
    set sectionsout=1 2
    set class=1
)
IF "%sectionsin%"=="1" (
    set sectionsout=1
    set class=0
)
IF "%sectionsin%"=="2" (
    set sectionsout=2
    set class=0
)
IF "%sectionsin%"=="c" (
    set sectionsout=
    set class=1
)

FOR %%i in (%courses%) do (
    FOR %%m in (%groupsout%) do (
        FOR %%n in (%sectionsout%) do (
            OneNote2PDF -Notebook "%%i" -CacheFolder %temp% -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "%%i_%%m_%%n"
        )
    )
    IF %class%==1 (
        OneNote2PDF -Notebook "%%i" -CacheFolder %temp% -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "%%i_Examples_class"
    )
)
