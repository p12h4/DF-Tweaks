@ECHO OFF
SETLOCAL

SET "VERSION=%1"
SET "TARGET=%2"

SET "BASE_PATH=%LocalAppData%\Packages"
SET "COMMON_PATH=LocalState\games\com.mojang\development_resource_packs\DFTweaks"

IF /I "%TARGET%"=="Release" (
   SET "DESTINATION=%BASE_PATH%\Microsoft.MinecraftUWP_8wekyb3d8bbwe\%COMMON_PATH%"
) ELSE (
   SET "DESTINATION=%BASE_PATH%\Microsoft.MinecraftWindowsBeta_8wekyb3d8bbwe\%COMMON_PATH%"
)


IF EXIST "%DESTINATION%" (
   RMDIR /s /q "%DESTINATION%"
)

MKDIR "%DESTINATION%"


ECHO Copying files from "%VERSION%" to "%DESTINATION%".
XCOPY "%~dp0..\%VERSION%\*" "%DESTINATION%" /E /H /C /I /Y > NUL


ECHO Deployment complete!
ENDLOCAL