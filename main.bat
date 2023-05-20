::=====setting environment=====
@ECHO OFF
set mod_desc=C-Banners.mod
set mod_dir=C-Banners
::=====setting environment end=====
::=====checking=====
ECHO Time:%date%
ECHO Checking the required folder...
if not exist output\ ( mkdir output\ ) else ( del /F /S /Q output\ & rmdir /S /Q output\ & mkdir output\ )
if not exist output\%mod_dir% mkdir output\%mod_dir%\
if exist %mod_dir%.zip del /F /S /Q %mod_dir%.zip
::=====checking end=====
::=====integrating files=====
ECHO.
ECHO Copying started.
ECHO.
xcopy %mod_dir%\ output\%mod_dir%\ /E /Q /C /Y
xcopy mod_descriptor\%mod_desc% output\ /E /Q /C /Y
ECHO path="mod/%mod_dir%" >> output\%mod_desc%
xcopy mod_descriptor\%mod_desc% output\%mod_dir%\ /Q /C /Y
ren output\%mod_dir%\%mod_desc% descriptor.mod
::==========
xcopy CHANGELOG.md output\%mod_dir%\ /Q /C /Y
del output\%mod_dir%\thumbnail.png
xcopy thumbnail.png output\%mod_dir%\ /Q /C /Y
ECHO.
ECHO Compressing the mod files...
7z.exe a %mod_dir%.zip .\output\%mod_dir%*
::=====post-processing end=====

ECHO.
ECHO End of script running.