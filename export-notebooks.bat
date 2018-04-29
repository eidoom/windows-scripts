@echo OFF

set PATH=C:\Users\ryan\Anaconda3

rem My Python scripting attempt failed as OneNote2PDF crashed when I used it, sadly. Maybe I'll figure out how to fix it at some point.
rem python C:\Users\ryan\scripts\export-notebooks.py -c %1 -s %2
rem rem Legacy exported, written in Batch before I realised I only like Batch for very simple logic:

echo # Notebook exporter
echo.

set temp=C:\Programs\OneNote2PDF_0.3\temp
set directory=C:\sync\physics\6_Part_iii\Courses

if %1.==. (
    set /p coursesin="Which subjects? [blank=all; acronyms, separate by a space, case insensitive] "
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

:again
if %2.==. (
    set /p sectionsin="Which section? [blank=all, l=lectures 1, s=lectures 2, e=examples 1, r=examples 2, c=examples class, p=past_papers] "
) else (
    set sectionsin=%~2
)

if "%sectionsin%"=="" (
    set sectionsout=Lectures_1 Lecture_2 Examples_1 Examples_2 Examples_class Past_papers
) else if "%sectionsin%"=="l" (
    set sectionsout=Lectures_1
) else if "%sectionsin%"=="s" (
    set sectionsout=Lectures_2
) else if "%sectionsin%"=="e" (
    set sectionsout=Examples_1
) else if "%sectionsin%"=="r" (
    set sectionsout=Examples_2
) else if "%sectionsin%"=="c" (
    set sectionsout=Examples_class
) else if "%sectionsin%"=="p" (
    set sectionsout=Past_papers
) else (
    echo No readable input!
    goto again
)

echo ## Section: %sectionsout%
echo.

for %%i in (%coursesout%) do (
    for %%m in (%sectionsout%) do (
            echo ## %%i_%%m
            C:\Programs\OneNote2PDF_0.3\OneNote2PDF.exe -Notebook "%%i" -CacheFolder "%temp%" -Output "%directory%\%%i\Exports" -Exclude OneNote_RecycleBin -ExportSection "%%i_%%m"
            echo.
    )
)

exit
