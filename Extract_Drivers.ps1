$model = (Get-WmiObject -Class:Win32_ComputerSystem).Model
New-Item -ItemType directory -Path \\hostname\f$\Drivers\$model
Export-WindowsDriver -Online -Destination \\hostname\f$\Drivers\$model 