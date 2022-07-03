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
    
you can check links and connection with php to mysql using "localhost" and "localhost/adminer" 'login and password you can see in the script.sh'
    
    sudo sh changessh.sh "It is change ssh port"
    sudo sh blockconnec.sh "It is block connections"
    sudo sh backup_mysql.sh
    sudo sh backup_apache.sh
