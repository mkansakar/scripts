$Servers = Get-Content ".\Documents\servers1.txt"

#1500 -> There were no changes detected since the last successful processing of Group Policy - Computer
#1501 -> There were no changes detected since the last successful processing of Group Policy - Users
#1502 -> New settings from X Group Policy objects were detected and applied
#1004 -> Citrix TDICA Transport Driver connection close
#1085 -> Failed to apply the IE zonemapping setting
#1112 -> Group policy client side ext. folder redirection was unable to apply.....bcoz changes must be proceed before system startup or user login
#1060 -> Remote Desktop Services User Home Directory was not set because the path specified does not exist 

Invoke-Command $Servers {
    $Filter = @{
           Logname = 'System'
           ID = 1500,1501,1502,1004,1085,1112
           #ID = 1085,1112
           StartTime =  [datetime]::Today.AddDays(-1)
           EndTime = [datetime]::Today
    }
    Get-WinEvent -FilterHashtable $Filter
 
} | Select-Object MachineName,TimeCreated,ID,Message | Out-GridView -Title "Results" 