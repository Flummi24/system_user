@echo off 
cd C:\System 
start "" nircmd.exe exec hide psexec.exe -s -i %1
