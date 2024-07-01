<#
Add Backup User in Veeam backup Solution for Microsoft Office 365
This script will add multiple users in backup profile with the help of csv file

Author Details:
Name: Md Ariful Hauqe
Email: hmariful@outlook.com
#>

$data=import-csv -Path "C:\Users\abu_r\Desktop\OutPut.csv"
foreach($users in $data)
    {
        $user_name=$users.uName
        $display_name=$users.dName
        $org = Get-VBOOrganization
        $user = Get-VBOOrganizationUser -Organization $org -UserName $user_name 
        $backupItemUser=New-VBOBackupItem -User $user -Mailbox -ArchiveMailbox -OneDrive
        $job = Get-VBOJob -Name "TestJob"
        Add-VBOBackupItem -Job $job -BackupItem $backupItemUser
    }
