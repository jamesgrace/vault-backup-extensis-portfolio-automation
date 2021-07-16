@echo off

REM - - - - - - - - - - - - version 31july2018 - - -
REM
REM 
REM 7-Zip (64bit) - http://www.7-zip.org
REM
REM  Blat (64bit) - http://www.blat.net
REM
REM
REM - - - - - - - - - - - - - - - - - - - - - - - - -


set blatlocation=C:\Program Files\Blat

set ziplocation=C:\Program Files\7-Zip

set backupfolder=D:\Extensis Portfolio VAULT Backups

set numbertokeep=3

set backuplogfilename=VAULT_Backup_Log.txt

set emailserver=celartem-com.mail.protection.outlook.com

set emailto=JGrace@extensis.com

set emailfrom=Playground_noreply@extensis.com

set emailsubject="Portfolio Notification: VAULT Backup Log"


REM - - - - - - - - - - - - - - - - - - - - - - - - -
REM - - - - - - - - - - - - - - - - - - - - - - - - -


del "%backupfolder%\%backuplogfilename%" /Q

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set thedate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set thetime=%%a%%b)

set foldername=vault_%thedate%_T%thetime%

> "%backupfolder%\%backuplogfilename%" 2>&1 (

REM "C:\Program Files (x86)\Extensis\Portfolio Server\applications\jre\bin\java.exe" -cp "C:\Program Files (x86)\Extensis\Portfolio Server\applications\lib\portfolio-utilities.jar;C:\Program Files (x86)\Extensis\Portfolio Server\applications\lib\dam-client.jar;C:\Program Files (x86)\Extensis\Portfolio Server\applications\lib\jettison-1.3.3.jar;C:\Program Files (x86)\Extensis\Portfolio Server\applications\lib\jersey-core-1.17.1.jar;C:\Program Files (x86)\Extensis\Portfolio Server\applications\lib\jersey-client-1.17.1.jar;C:\Program Files (x86)\Extensis\Portfolio Server\applications\lib\json-simple-1.1.1.jar" -Xmx512m extensis.portfolio.clUtilities.PortfolioUtilitiesMain cleanupvault -p Portfolio2018 -noprompt

mkdir "%backupfolder%\%foldername%"

"C:\Program Files (x86)\Extensis\Portfolio Server\applications\mongodb\bin\mongodump.exe" --port 37017 --out "%backupfolder%\%foldername%"

"%ziplocation%\7z.exe" a -tzip "%backupfolder%\%foldername%.zip" "%backupfolder%\%foldername%"

rmdir "%backupfolder%\%foldername%" /s /q

forfiles -p "%backupfolder%" -s -m *.zip /D -%numbertokeep% /C "cmd /c del @path"

)

"%blatlocation%\blat.exe" "%backupfolder%\%backuplogfilename%" -to %emailto% -f %emailfrom% -s %emailsubject% -server %emailserver%
