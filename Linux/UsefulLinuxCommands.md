Version:
```
cat /etc/os-release
```
IP Address
```
ifconfig
```

Users:
```
who
```
Replace # with the number of the user listed
```
pkill -9 -t pts/# 
```
Process
```
ps
```


Get failed logins
```
grep "Failed password" /var/log/auth.log
```

Clear bash history:
```
history -c && rm ~/.bash_history
```
