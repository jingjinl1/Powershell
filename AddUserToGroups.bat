@echo off
powershell.exe -ExecutionPolicy Bypass -File "Path\to\file.ps1"
schtasks /Delete /TN "TaskName" /F