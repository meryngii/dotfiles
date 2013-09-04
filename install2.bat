@echo on

if %HOME%=='' set %HOME%=%HOMEDRIVE%%HOMEPATH%

cd %HOME%\dotfiles

rem call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.cmd" /x64
cd _vim\bundle\vimproc
nmake /f "make_msvc64.mak" nodebug=1

pause

