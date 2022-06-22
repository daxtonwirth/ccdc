## System Info
Version:
- `cat /etc/os-release`

`cat /proc/meminfo`

IP Address
```
ifconfig
```

## Users
```
cat /etc/passwd
who
```

Replace # with the number of the user listed
```
pkill -9 -t pts/# 
```
`last` - people who have been logged in

`w` (what a user is doing)

`pinky`

`wall` display message on terminal of all logged in users

## Process
```
ps auxf
```
```
pstree
top
```

```
ss -tl
```

Get failed logins
```
grep "Failed password" /var/log/auth.log
```

start/stop/restart service (stop unused services)
`systemctl restart service`


## Clear bash history:
```
history -c && rm ~/.bash_history
```

## Firewall:
```
sudo ufw status
```

`/etc/apache/ports.conf` change default ports 

`netstat -tuna`

## Two factor auth
`sudo apt install libpam-google-autenticator 2 factor auth`


## Other
sudo lsof -i :3306 (ls open files)
which mysqld
dpkg -S /usr/sbin/mysqld
sudo apt purge SERVICE

systemctl mask ctrl-alt-del.target 
lastb- list of unsuccessful logins

passwordless logins
ssh-keygen on target machine
ssh-copy-id to host machine

fail2ban
dynamically blocks ip addresses with certain number of failed logins
/etc/fail2ban/jail.conf

more info about user
net user USER
net localgroup Administrators

Login information
sudo last -f /var/log/wtmp
reboot   system boot  5.4.0-1029-aws   Tue Mar 29 17:28   still running
reboot   system boot  5.4.0-1029-aws   Tue Mar 29 04:46 - 15:52  (11:05)
reboot   system boot  5.4.0-1029-aws   Mon Mar 28 01:35 - 01:51 (1+00:16)

/var/log/auth.log

 lsblk -f shows file system type

adduser is better than useradd

gshadow group password
