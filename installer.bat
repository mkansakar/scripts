@ECHO OFF
for /f "tokens=*" %%a in (C:\softwares\desktops.txt) do (
psexec \\%%a cmd /c "c:\windows\temp\npp.7.6.2.Installer.x64.exe" /S 
psexec \\%%a cmd /c "c:\windows\temp\BCompare-4.2.9.23626.exe" /silent 
echo "done" %%a
)

