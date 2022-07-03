# TASK
1. Install apache2, php, mysql
2. Change SSH default port to 2234
3. Add rule that block all requests to all ports except web servers from external IPs (not DHCP range)
4. Backup home folder NGINX 4 times a day and should keep backups for last 10 days
5. Backup mysql once per hour and should keep backups for last 10 days

# Solution
# In the beggining run "sudo chmod +x *.sh"

    sudo sh script.sh "Install required programs"
    sudo sh mysql.sh "Create root password and DB"
    
you can check links and connection with php to mysql using "localhost" and "localhost/adminer" 'login - root , password - mypass'
    
    sudo sh changessh.sh "It is change ssh port"
    sudo sh blockconnec.sh "It is block connections"
    sudo sh backup_mysql.sh
    sudo sh backup_apache.sh

# ADD schedule to cronjob

    use crontab -e and chose wich editor do you want to edit and copy this
    
     ┌───────────── minute (0 - 59)
     │     ┌───────────── hour (0 - 23)
     │     │     ┌───────────── day of the month (1 - 31)
     │     │     │   ┌───────────── month (1 - 12)
     │     │     │   │   ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
     │     │     │   │   │                                   7 is also Sunday on some systems)
     │     │     │   │   │
     0     */6   *   *   *     ~/backup_apache.sh
     0     *     *   *   *     ~/backup_mysql.sh
