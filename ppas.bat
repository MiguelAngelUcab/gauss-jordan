@echo off
SET THEFILE=c:\users\miguel\desktop\vector~1\proyecto\source-3.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o c:\users\miguel\desktop\vector~1\proyecto\source-3.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
