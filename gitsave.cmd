echo off
echo - Read to Stage files, commit and push. Be sure you have pulled latest changes
echo   will use commit message of  %1%
pause
git remote add ruby master
git status
echo Next will be an "add .", followed by "git commit"
pause
git add .
git commit -am %1%

:finished
echo finished - to send to Github : 
echo "git push ruby master"
