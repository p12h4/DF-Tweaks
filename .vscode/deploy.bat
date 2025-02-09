@ECHO OFF
SETLOCAL

SET "VERSION=%1"
SET "TARGET=%2"

SET "RELEASE_PATH=%LocalAppData%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\DFTweaks"
SET "PREVIEW_PATH=%LocalAppData%\Packages\Microsoft.MinecraftWindowsBeta_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\DFTweaks"


IF "%TARGET%"=="Release" (
   SET "DESTINATION=%RELEASE_PATH%"
) ELSE (
   SET "DESTINATION=%PREVIEW_PATH%"
)


IF EXIST "%DESTINATION%" (
   RMDIR /s /q "%DESTINATION%"
)

MKDIR "%DESTINATION%"


ECHO Copying files from "%VERSION%" to "%DESTINATION%".
XCOPY "%~dp0..\%VERSION%\*" "%DESTINATION%" /E /H /C /I /Y > NUL


ECHO Deployment complete!
ENDLOCAL