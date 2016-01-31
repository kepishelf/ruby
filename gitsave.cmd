echo off
echo - Read to Stage files, commit and push. Be sure you have pulled latest changes
echo   will use commit message of  %1%
pause
git add .
git remote add ruby master
git commit -am %1%

:finished
echo finished
