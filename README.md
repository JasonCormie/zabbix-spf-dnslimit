# zabbix-spf-dnslimit
Basic SPF health check shell script with zabbix template

To use the shell script,

./spfcount.sh domain.com

To use with Zabbix, copy to Zabbix externalscripts directory.

Import template file

Create a new host with IP 127.0.0.1 and the name of the domain you want to test.
