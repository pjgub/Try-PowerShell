<#
This script will be used to perform simple tasks 
on file handling using PowerShell
#>

#Read a random file into PowerShell
$Path = Get-Location
if (Test-Path "$Path\Random.txt"){

    $file_content = Get-Content "$Path\Random.txt"
    Write-Output "File EXIST"

} else {

    Write-Output "File Do NOT Exist"

}

#Search by a key(a string) and report number of occurrences of it.
$key_string = "Statement1"
if($file_content.Contains($key_string)){

    "String occurs" + (($file_content | Select-String $key_string).count)

} else {

   "String $key_string not found"

}


#Print each line from the file by printing line number in starting of each line
$count=0

foreach($line in $file_content){

    $count++

    Write-Host "Line" $count ": " $line


}


#Print only even lines by its line number
$count=0

foreach($line in $file_content){

    $count++

    if($count%2 -eq 0){

        Write-Host "Line" $count ": " $line

    }

}


#Sort all the lines and write into another file using a single PowerShell statement
$file_content | Sort-Object | Out-File "test.txt"