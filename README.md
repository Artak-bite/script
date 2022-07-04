# TASK
1. Install apache2, php, mysql
2. Change SSH default port to 2234
3. Add rule that block all requests to all ports except web servers from external IPs (not DHCP range)
4. Backup home folder NGINX 4 times a day and should keep backups for last 10 days
5. Backup mysql once per hour and should keep backups for last 10 days

# Solution
## In the beggining run "sudo chmod +x *.sh"
### NOTE. MySql password is hardcoded. Please consider changing the file before running the script.

Install required programs
Create root password and DB

    sudo sh install.sh
    sudo sh mysql.sh
    
you can check links and connection with php to mysql using "localhost" and "localhost/adminer" 'login - root , password - mypass'

It is change ssh port
It is block connections
And backups files

    sudo sh changessh.sh
    sudo sh blockconnec.sh
    sudo sh backup_mysql.sh
    sudo sh backup_apache.sh

## ADD jobs to cron

use "crontab -e" comand and chose wich editor do you want to edit and copy this
    
     ┌───────────── minute (0 - 59)
     │     ┌───────────── hour (0 - 23)
     │     │     ┌───────────── day of the month (1 - 31)
     │     │     │   ┌───────────── month (1 - 12)
     │     │     │   │   ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
     │     │     │   │   │                                   7 is also Sunday on some systems)
     │     │     │   │   │
     0     */6   *   *   *     ~/backup_apache.sh
     0     *     *   *   *     ~/backup_mysql.sh
