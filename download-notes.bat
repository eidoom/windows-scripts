@ECHO off

SET PATH=C:\Users\ryan\Anaconda3

cd C:\git\projects\scrape-cam-stuff

set /p courses="Which subjects? [acronyms, please] "

for %%c in (%courses%) do (
    python dl-%%c.py
)
