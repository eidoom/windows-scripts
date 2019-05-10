@ECHO off

SET PATH=C:\Users\ryan\Anaconda3

cd C:\git\projects\scrape-cam-stuff

set /p courses="Download what? [subject acronym/pp/er] "

for %%c in (%courses%) do (
    python dl-%%c.py
)
