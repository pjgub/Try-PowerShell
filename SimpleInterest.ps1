<#
Script to obtain the simple interest (SI) of a loan
The SI is given by the equation: P * R * T / 100 where,
    P is the Principle
    R is the Rate of Interest
    T is the time in years
#>

#Let's assume a P range of 500$-50000$
[ValidateRange(500,50000)][int]$P = (Read-Host "Principle (500$-50000$)")

#Let's assume an I range of 7%-12%
[ValidateRange(7,12)][double]$R = (Read-Host "Rate of Interest (7%-12%) ")

#Let's assume a T range of 5-30 years
[ValidateRange(5,30)]$T = [int] (Read-Host "Time in years (5-30) ")

#Calculate the SI
$SI = $P*$R*$T/100

#Write an output statement
Write-Host "Simple interest for the loan will be $SI$"