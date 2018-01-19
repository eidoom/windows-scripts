@echo OFF

cd C:\Programs\OneNote2PDF_0.3

set temp="C:\Programs\OneNote2PDF_0.3\temp"
set directory=C:\sync\physics\6_Part_iii\Courses

set /p courses="Which subjects? [acronyms, case insensitive] "
set /p groupsin="Which groups? [0=all, 1=lectures, 2=examples] "
set /p sectionsin="Which sections? [0=all, c=class, 1=first, 2=second, etc]"

IF "%groupsin%"=="0" (
    set groupsout=Lectures Examples
)
IF "%groupsin%"=="1" (
    set groupsout=Lectures
)
IF "%groupsin%"=="2" (
    set groupsout=Examples
)

IF "%sectionsin%"=="0" (
    set sectionsout=First Second
    set class=1
)
IF "%sectionsin%"=="1" (
    set sectionsout=First
    set class=0
)
IF "%sectionsin%"=="2" (
    set sectionsout=econd
    set class=0
)
IF "%sectionsin%"=="c" (
    set sectionsout=
    set class=1
)

FOR %%i in (%courses%) do (
    FOR %%m in (%groupsout%) do (
        FOR %%n in (%sectionsout%) do (
            OneNote2PDF -Notebook "%%i" -CacheFolder %temp% -Output "%directory%\%%i\%%m" -Exclude OneNote_RecycleBin -ExportSection "%%m/%%n"
        )
    )
    IF %class%==1 (
        OneNote2PDF -Notebook "%%i" -CacheFolder %temp% -Output "%directory%\%%i\Examples" -Exclude OneNote_RecycleBin -ExportSection "Examples/Class"
    )
)
