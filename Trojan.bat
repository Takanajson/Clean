@echo off
title ---------------Trojan Remover by not_thorny ----------------
echo Starting soon, don't touch anything not_thorny is working............
timeout 3 > NUL
cls
if %CD%==C:\ goto DeleteC
if %CD%==D:\ goto DeleteD
if %CD%==E:\ goto DeleteE


:DeleteC
attrib -h -r -s /s /d C:\Windows\Resources\svchost.exe
attrib -h -r -s /s /d C:\Windows\Resources\spoolsv.exe
attrib -h -r -s /s /d C:\Windows\Resources\Themes\explorer.exe
attrib -h -r -s /s /d C:\Windows\Resources\Themes\icsys.icn.exe
wmic process where ExecutablePath='C:\\Windows\\Resources\\svchost.exe' CALL TERMINATE /nointeractive
del /f /A:S C:\Windows\Resources\svchost.exe
del /f C:\Windows\Resources\svchost.exe
wmic process where ExecutablePath='C:\\Windows\\Resources\\Themes\\explorer.exe' CALL TERMINATE /nointeractive
del /f /A:S C:\Windows\Resources\Themes\explorer.exe
del /f C:\Windows\Resources\Themes\explorer.exe
wmic process where ExecutablePath='C:\\Windows\\Resources\\spoolsv.exe' CALL TERMINATE /nointeractive
del /f /A:S C:\Windows\Resources\spoolsv.exe
del /f C:\Windows\Resources\spoolsv.exe
wmic process where ExecutablePath='C:\\Windows\\Resources\\Themes\\icsys.icn.exe' CALL TERMINATE /nointeractive 
del /f /A:S C:\Windows\Resources\Themes\icsys.icn.exe
del /f C:\Windows\Resources\Themes\icsys.icn.exe
wmic process where ExecutablePath='C:\\Windows\\Windows\\Temp\\icsys.icn.exe' CALL TERMINATE /nointeractive
del /f C:\Windows\Windows\Temp\icsys.icn.exe
del /f C:\Windows\Framework\v4.0.30319\icsys.icn.exe
del /f C:\Windows\Platform\4.18.24090.11-0\icsys.icn.exe
wmic process where ExecutablePath='C:\\Windows\\Platform\\4.18.24090.11-0\\icsys.icn.exe' CALL TERMINATE /nointeractive 
del /f C:\Windows\Prefetch\4.18.24090.11-0\icsys.icn.exe
wmic process where ExecutablePath='C:\\Windows\\Prefetch\\4.18.24090.11-0\\icsys.icn.exe' CALL TERMINATE /nointeractive 

goto checkC

:DeleteD
attrib -h -r -s /s /d D:\Windows\Resources\svchost.exe
attrib -h -r -s /s /d D:\Windows\Resources\spoolsv.exe
attrib -h -r -s /s /d D:\Windows\Resources\Themes\explorer.exe
attrib -h -r -s /s /d D:\Windows\Resources\Themes\icsys.icn.exe
wmic process where ExecutablePath='D:\\Windows\\Resources\\svchost.exe' CALL TERMINATE /nointeractive
del /f /A:S D:\Windows\Resources\svchost.exe
del /f D:\Windows\Resources\svchost.exe
wmic process where ExecutablePath='D:\\Windows\\Resources\\Themes\\explorer.exe' CALL TERMINATE /nointeractive
del /f /A:S D:\Windows\Resources\Themes\explorer.exe
del /f D:\Windows\Resources\Themes\explorer.exe
wmic process where ExecutablePath='D:\\Windows\\Resources\\spoolsv.exe' CALL TERMINATE /nointeractive
del /f /A:S D:\Windows\Resources\spoolsv.exe
del /f D:\Windows\Resources\spoolsv.exe
wmic process where ExecutablePath='D:\\Windows\\Resources\\Themes\\icsys.icn.exe' CALL TERMINATE /nointeractive 
del /f /A:S D:\Windows\Resources\Themes\icsys.icn.exe
del /f D:\Windows\Resources\Themes\icsys.icn.exe
goto checkD

:DeleteE
attrib -h -r -s /s /d E:\Windows\Resources\svchost.exe
attrib -h -r -s /s /d E:\Windows\Resources\spoolsv.exe
attrib -h -r -s /s /d E:\Windows\Resources\Themes\explorer.exe
attrib -h -r -s /s /d E:\Windows\Resources\Themes\icsys.icn.exe
wmic process where ExecutablePath='E:\\Windows\\Resources\\svchost.exe' CALL TERMINATE /nointeractive
del /f /A:S E:\Windows\Resources\svchost.exe
del /f E:\Windows\Resources\svchost.exe
wmic process where ExecutablePath='E:\\Windows\\Resources\\Themes\\explorer.exe' CALL TERMINATE /nointeractive
del /f /A:S E:\Windows\Resources\Themes\explorer.exe
del /f E:\Windows\Resources\Themes\explorer.exe
wmic process where ExecutablePath='E:\\Windows\\Resources\\spoolsv.exe' CALL TERMINATE /nointeractive
del /f /A:S E:\Windows\Resources\spoolsv.exe
del /f E:\Windows\Resources\spoolsv.exe
wmic process where ExecutablePath='E:\\Windows\\Resources\\Themes\\icsys.icn.exe' CALL TERMINATE /nointeractive 
del /f /A:S E:\Windows\Resources\Themes\icsys.icn.exe
del /f E:\Windows\Resources\Themes\icsys.icn.exe
goto checkE

:checkC
if exist C:\Windows\Resources\svchost.exe goto DeleteC
if exist C:\Windows\Resources\spoolsv.exe goto DeleteC
if exist C:\Windows\Resources\Themes\explorer.exe goto DeleteC
if exist C:\Windows\Resources\Themes\icsys.icn.exe goto DeleteC
goto end

:checkD
if exist D:\Windows\Resources\svchost.exe goto DeleteD
if exist D:\Windows\Resources\spoolsv.exe goto DeleteD
if exist D:\Windows\Resources\Themes\explorer.exe goto DeleteD
if exist D:\Windows\Resources\Themes\icsys.icn.exe goto DeleteD
goto end

:checkE
if exist E:\Windows\Resources\svchost.exe goto DeleteE
if exist E:\Windows\Resources\spoolsv.exe goto DeleteE
if exist E:\Windows\Resources\Themes\explorer.exe goto DeleteE
if exist E:\Windows\Resources\Themes\icsys.icn.exe goto DeleteE

:end
cls
echo Done! Trojan Virus Is Removed Successfully!