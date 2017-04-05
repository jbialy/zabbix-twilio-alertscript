# zabbix-twilio-alertscript
Zabbix alertscript for Twilio SMS

This is simple bash script that uses the Twilio messaging service to send alert messages. Since the script uses curl it could be easily adopted to use other SMS service providers. 

The script is based on the Slack alert script by [Eric OC](https://github.com/ericoc).

Installation
------------

The script was tested on Zabbix 2.2.x.

Place the script in the `AlertScriptsPath` specified in your `/etc/zabbix/zabbix_server.conf`. Usually `/usr/lib/zabbix/alertscripts` and make it `chmod 755`.
