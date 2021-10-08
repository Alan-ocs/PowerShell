# 70-740 LAB Creation

# Import-Module Hyper-V

$ethernet = Get-NetAdapter -Name "Ethernet*"
$VMLocation = "D:\LAB\VHD\"
$ISOLocation = "D:\LAB\ISO\"

#Create Virtual Switches

New-VMSwitch -Name externalSwitch -NetAdapterName $ethernet.name -AllowManagementOS $true
New-VMSwitch -Name privateSwitch_range192 -SwitchType Private
New-VMSwitch -Name privateSwitch_range10 -SwitchType Private

#Create DC Server

New-VM -Name ServerAD -path $VMLocation -MemoryStartupBytes 3gb -Generation 2 -SwitchName privateSwitch_range10
New-VHD -Path $VMLocation\ServerAD\ServerAD.vhdx -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName ServerAD -path "$VMLocation\ServerAD\ServerAD.vhdx"
Add-VMDvdDrive -VMName ServerAD -ControllerNumber 1 -Path "$VMLocation\ServerAD\ServerAD.vhdx"
Add-VMDvdDrive -VMName ServerAD -Path "$ISOLocation\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"

#Create Server 01

New-VM -Name Server01 -path $VMLocation -MemoryStartupBytes 2gb -Generation 2 -SwitchName privateSwitch_range10
New-VHD -Path $VMLocation\Server01\Server01.vhdx -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName Server01 -path "$VMLocation\Server01\Server01.vhdx"
Add-VMDvdDrive -VMName Server01 -ControllerNumber 1 -Path "$VMLocation\Server01\Server01.vhdx"
Add-VMDvdDrive -VMName Server01 -Path "$ISOLocation\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"

#Create Server 02

New-VM -Name Server02 -path $VMLocation -MemoryStartupBytes 2gb -Generation 2 -SwitchName privateSwitch_range10
New-VHD -Path $VMLocation\Server02\Server02.vhdx -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName Server02 -path "$VMLocation\Server02\Server02.vhdx"
Add-VMDvdDrive -VMName Server02 -ControllerNumber 1 -Path "$VMLocation\Server02\Server02.vhdx"
Add-VMDvdDrive -VMName Server02 -Path "$ISOLocation\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"

#Create Server 03

New-VM -Name Server03 -path $VMLocation -MemoryStartupBytes 2gb -Generation 2 -SwitchName privateSwitch_range192
New-VHD -Path $VMLocation\Server03\Server03.vhdx -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName Server03 -path "$VMLocation\Server03\Server03.vhdx"
Add-VMDvdDrive -VMName Server03 -ControllerNumber 1 -Path "$VMLocation\Server03\Server03.vhdx"
Add-VMDvdDrive -VMName Server03 -Path "$ISOLocation\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"

#Create Gateway

New-VM -Name ServerADM -path $VMLocation -MemoryStartupBytes 2gb -Generation 2 -SwitchName privateSwitch_range10
New-VHD -Path $VMLocation\ServerADM\ServerADM.vhdx -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName ServerADM -path "$VMLocation\ServerADM\ServerADM.vhdx"
Add-VMDvdDrive -VMName ServerADM -ControllerNumber 1 -Path "$VMLocation\ServerADM\ServerADM.vhdx"
Add-VMDvdDrive -VMName ServerADM -Path "$ISOLocation\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
Add-VMNetworkAdapter -VMName ServerADM -SwitchName externalSwitch
Add-VMNetworkAdapter -VMName ServerADM -SwitchName privateSwitch_range10
Add-VMNetworkAdapter -VMName ServerADM -SwitchName privateSwitch_range192

#Create Client 01

New-VM -Name Client01 -path $VMLocation -MemoryStartupBytes 1.5gb -Generation 2 -SwitchName privateSwitch_range192
New-Item -Name "Client01" -Path $VMLocation -ItemType Directory
New-VHD -Path $VMLocation\Client01\Client01.vhdx -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName Client01 -path "$VMLocation\Client01\Client01.vhdx"
Add-VMDvdDrive -VMName Client01 -ControllerNumber 1 -Path "$VMLocation\Client01\Client01.vhdx"
Add-VMDvdDrive -VMName Client01 -Path "$ISOLocation\19041.264.200511-0456.vb_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"

#Create Client 02

New-VM -Name Client02 -path $VMLocation -MemoryStartupBytes 1.5gb -Generation 2 -SwitchName privateSwitch_range10
New-Item -Name "Client02" -Path $VMLocation -ItemType Directory
New-VHD -Path $VMLocation\Client02\Client02.vhdx -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName Client02 -path "$VMLocation\Client02\Client02.vhdx"
Add-VMDvdDrive -VMName Client02 -ControllerNumber 1 -Path "$VMLocation\Client02\Client02.vhdx"
Add-VMDvdDrive -VMName Client02 -Path "$ISOLocation\19041.264.200511-0456.vb_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"