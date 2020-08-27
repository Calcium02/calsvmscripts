@echo off
set /p LoginPath=Which User?
set /p VMPath=Which VM?
set /p ProjectPath=Which Project?

start C:\windows\system32\cmd.exe /k ""C:\Users\dakot\AppData\Local\Google\Cloud SDK\cloud_env.bat" && gcloud compute ssh %LoginPath%@%VMPath% --project %ProjectPath%" 
