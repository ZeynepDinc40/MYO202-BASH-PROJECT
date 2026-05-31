#!/bin/bash

# ZEYNEP FEYZA DİNÇ
# 2420171038
# https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=qKrhe9adEg
# https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=1kZCedDn0e
# https://credsverse.com/credentials/3cf102d1-e682-41ed-84c7-6f4c33f8c5db


echo "program basladi"

echo "Tarih Bilgisi:" > report.log
date -Iseconds >> report.log

echo "" >> report.log
echo "Islemci:" >> report.log
wmic cpu get name >> report.log 2>/dev/null || powershell "Get-CimInstance Win32_Processor | Select Name" >> report.log

echo "" >> report.log
echo "RAM:" >> report.log
wmic memorychip get capacity >> report.log 2>/dev/null || powershell "Get-CimInstance Win32_PhysicalMemory | Select Capacity" >> report.log

echo "" >> report.log
echo "Anakart:" >> report.log
wmic baseboard get product >> report.log 2>/dev/null || powershell "Get-CimInstance Win32_BaseBoard | Select Product" >> report.log

echo "" >> report.log
echo "UUID:" >> report.log
wmic csproduct get uuid >> report.log 2>/dev/null || powershell "Get-CimInstance Win32_ComputerSystemProduct | Select UUID" >> report.log

echo "" >> report.log
echo "Disk:" >> report.log
wmic diskdrive get serialnumber >> report.log 2>/dev/null || powershell "Get-CimInstance Win32_DiskDrive | Select SerialNumber" >> report.log

echo "" >> report.log
echo "MAC:" >> report.log
getmac >> report.log

read -p "Parola Giriniz: " PAROLA

gpg --batch --yes --passphrase "$PAROLA" -c --cipher-algo AES256 report.log

rm report.log

echo "bitti"
