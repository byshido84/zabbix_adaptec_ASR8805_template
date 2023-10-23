@echo off
cd "C:\Program Files\Adaptec\maxView Storage Manager"
arcconf GETCONFIG 1 AD > C:\zabbix_agent\scripts\ad
arcconf GETCONFIG 1 PD > C:\zabbix_agent\scripts\pd
arcconf GETCONFIG 1 LD > C:\zabbix_agent\scripts\ld