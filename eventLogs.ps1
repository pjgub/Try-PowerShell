<#
This script will:

-> Read multiple machine names from a text file;

-> Ask the user to specify which log they want to scan- like Application, System, etc;

-> Upon providing input, ask for event ID which they are looking for;


Once this information is provided, Script should scan all the computers event logs for provided eventID and generate a nicely formatted CSV report whose headers should be:

 "MachineName","TimeGenerated","Source","Message"
 #>

 #-> Read multiple machine names from a text file;
[String[]]$machine = Get-Content machine_list.txt

#-> Ask user to specify which log they want to scan- like Application, System etc;
[String]$logType = (Read-Host "Enter type of log you want to scan (Application, Security, etc)")

#->Ask for event ID which they are looking for;
[Int]$eventID = (Read-Host "Enter the Event ID Number")

#Scanning the machine event logs
Get-EventLog -ComputerName $machine -LogName $logType| ?{$_.eventid -eq "$eventID"} | select MachineName,TimeGenerated,Source,Message | Export-Csv output.csv -NoTypeInformation
   
#Final Statement
[string]$Path = Get-Location
Write-Host  "Script execution Completed
Report saved at $Path"