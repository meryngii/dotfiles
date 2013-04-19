
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat"
cd .vim\bundle\vimproc
nmake /f "make_msvc64.mak"

pause

