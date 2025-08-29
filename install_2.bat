@echo off
chcp 65001
title System User Installer
color a
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo 1) Continue Installation
echo.
echo 2) Cancel Installtion
echo.
echo 3) Exit
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
set /p input1="Please Chose an Option: "
if %input1% == 1 goto 1
if %input1% == 2 goto 2
if %input1% == 3 exit 0
if %input1% == 1705 goto developer

:1
title System User Installtion2: Task: Make .REG
cls

for /f "skip=1 tokens=2 delims==" %%i in ('wmic useraccount where name^="systemuser" get sid /value') do set "sid=%%i"


echo Windows Registry Editor Version 5.00 > install.reg
echo. >> install.reg
echo [HKEY_USERS\%sid%_Classes\exefile] >> install.reg
echo. >> install.reg
echo [HKEY_USERS\%sid%_Classes\exefile\shell] >> install.reg
echo. >> install.reg
echo [HKEY_USERS\%sid%_Classes\exefile\shell\open] >> install.reg
echo. >> install.reg
echo [HKEY_USERS\%sid%_Classes\exefile\shell\open\command] >> install.reg
echo @="C:\\System\\runassystem.bat \"%%1\"" >> install.reg



echo Windows Registry Editor Version 5.00 > uac.reg
echo. >> uac.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System] >> uac.reg
echo "EnableLUA"=dword:00000000 >> uac.reg



echo Windows Registry Editor Version 5.00 > eula.reg
echo. >> eula.reg
echo [HKEY_CURRENT_USER\SOFTWARE\Sysinternals\PsExec] >> eula.reg
echo "EulaAccepted"=dword:00000001 >> eula.reg


title System User Installtion2: Task: Write .REG to Registry
cls
regedit /s install.reg
regedit /s eula.reg
regedit /s uac.reg

title System User Installtion2: Task: Finish
cls
echo.
echo                                                     FINISH
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo 1) Restart now
echo.
echo 2) Restart later Manual
echo.
echo 3) Exit
echo.
echo.
echo ADVANCED OPTIONS
echo.
echo Install Directory: C:\System
echo.
echo Username: systemuser (System)
echo.
echo Version: 1.0
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
set /p inputend="Please Chose an Option: "
if %inputend% == 1 shutdown /r /t 1
if %inputend% == 2 exit 0
if %inputend% == 3 exit 0



:developer
@echo off
title System User Developer Install Manager
color a
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo 1) Get Data
echo.
echo 2) Create User
echo.
echo 3) Add User to Administrator
echo.
echo 4) Create Directory
echo.
echo 5) Downloading Files
echo.
echo INSTALLTION PART 2: C:\System\install_2.bat
echo.
echo 6) Make .REG
echo.
echo 7) Write .REG to Registry
echo.
echo 8) Finisch
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
set /p inputdev="Please Chose an Task: "
if %inputdev% == 1 goto get_data
if %inputdev% == 2 goto create_user
if %inputdev% == 3 goto add_admin
if %inputdev% == 4 goto mkdir
if %inputdev% == 5 goto download
if %inputdev% == 6 goto create_reg
if %inputdev% == 7 goto write_reg
if %inputdev% == 8 goto finisch



:create_reg
title System User Developer: Task: Make .REG
cls

for /f "skip=1 tokens=2 delims==" %%i in ('wmic useraccount where name^="systemuser" get sid /value') do set "sid=%%i"


echo Windows Registry Editor Version 5.00 > install.reg
echo. >> install.reg
echo [HKEY_USERS\%sid%_Classes\exefile] >> install.reg
echo. >> install.reg
echo [HKEY_USERS\%sid%_Classes\exefile\shell] >> install.reg
echo. >> install.reg
echo [HKEY_USERS\%sid%_Classes\exefile\shell\open] >> install.reg
echo. >> install.reg
echo [HKEY_USERS\%sid%_Classes\exefile\shell\open\command] >> install.reg
echo @="C:\\System\\runassystem.bat \"%%1\"" >> install.reg



echo Windows Registry Editor Version 5.00 > uac.reg
echo. >> uac.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System] >> uac.reg
echo "EnableLUA"=dword:00000000 >> uac.reg



echo Windows Registry Editor Version 5.00 > eula.reg
echo. >> eula.reg
echo [HKEY_CURRENT_USER\SOFTWARE\Sysinternals\PsExec] >> eula.reg
echo "EulaAccepted"=dword:00000001 >> eula.reg

pause /t 10000000 >nul | echo Press any Key to Continue...

goto developer

:write_reg
title System User Developer: Task: Write .REG to Registry
cls
regedit /s install.reg
regedit /s eula.reg
regedit /s uac.reg

pause /t 10000000 >nul | echo Press any Key to Continue...

goto developer

:finisch
title System User Developer: Task: Finish
cls
echo.
echo                                                     FINISH
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo 1) Restart now
echo.
echo 2) Restart later Manual
echo.
echo 3) Exit
echo.
echo.
echo ADVANCED OPTIONS
echo.
echo Install Directory: C:\System
echo.
echo Username: systemuser (System)
echo.
echo Version: 1.0
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
set /p inputend="Please Chose an Option: "
if %inputend% == 1 shutdown /r /t 1
if %inputend% == 2 exit 0
if %inputend% == 3 exit 0
