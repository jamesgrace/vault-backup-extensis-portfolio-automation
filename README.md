# vault-backup-extensis-portfolio-automation
Microsoft Windows Batch script that include logging , retention of a desired number of previous Vault backups , as well as email notifications. Note that the script can be scheduled to run at a predetermined time via the Microsoft Windows Task Scheduler.

#### Requirements :
* Extensis Portfolio version 3.6.3 ( _or greater_ ).
* 7-Zip ( _64bit_ ) - http://www.7-zip.org
* Blat ( _64bit_ ) - http://www.blat.net

## Installation Procedure :

#### 1. PORTFOLIO SERVER VERSION
* Via the Portfolio Administration ( _:8091_ ) Web interface , verify the current version of your Portfolio instance.
  * Although the provided example may work with earlier Portfolio versions , Portfolio version 3.6.3 ( _or greater_ ) is recommended.

#### 2. DATA DRIVE PROVISIONING
* Verify that the target data drive has been provisioned with ample drive space and that the desired sub-folder has been created.

#### 3. BATCH FILE CONFIGURATION
* **`VAULT_backup.cmd`**

  * `blatlocation` = `C:\Program Files\Blat`
  * `ziplocation` = `C:\Program Files\7-Zip`
  * `backupfolder` = `D:\Extensis Portfolio VAULT Backups`
  * `numbertokeep` = `3`
  * `backuplogfilename` = `VAULT_Backup_Log.txt`
  * `emailserver` = `example-com.mail.protection.outlook.com`
  * `emailto` = `helpdesk@example.com`
  * `emailfrom` = `portfolio_noreply@example.com`
  * `emailsubject` = `"Portfolio Notification: VAULT Backup Log"`
