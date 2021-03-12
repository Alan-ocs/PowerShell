Invoke-Command -ComputerName HOSTNAME -ScriptBlock {
Get-PnpDevice | Where-Object {$_.FriendlyName -like '*touch screen*'} | Disable-PnpDevice -Confirm:$false} 

# Modify the HOSTNAME with the remote computer name.