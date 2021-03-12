$ServerName = "HOSTNAME" #Modify with your ServerName
Get-eventlog -ComputerName $ServerName -LogName System -EntryType Error -After (Get-Date).AddDays(-1) | select EventID, TimeGenerated, Message