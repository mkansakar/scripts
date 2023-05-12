@ECHO OFF
for /f "tokens=*" %%a in (C:\softwares\desktops1.txt) do (
psexec \\%%a cscript "c:\windows\system32\slmgr.vbs"  /ipk ####-####-####-####-#### 
psexec \\%%a cscript "c:\windows\system32\slmgr.vbs" /ato
echo "done" %%a
)

