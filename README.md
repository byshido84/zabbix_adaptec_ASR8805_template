# zabbix_adaptec_ASR8805_template
## Description

This is an enhanced template for discovering and monitoring adaptec ASR8805 storage controllers by using outputs of arcconf cli tool. Useful only if you have 
one adaptec adapter in server (i don't have servers with more fore testing). Tested and works zabbix 6.4.1

## Main features

* Discovery of controllers, logical discs, physical discs, batteries
* Monitoring controllers, logical, physical discs, batteries. Added temperature
* Comfortable changing of time intervals by macroses.

## Installation
Since the controller is acting terribly slow and takes a minute to output values, I created a simple BAT file that pre-fetches all the data through arcconf.

In the Windows Task Scheduler, I run a simple BAT file every 2.5 minutes that records the execution results of the arcconf commands into a text file. Then, I gather and process the data from the text file using PowerShell.

### Zabbix server

* Import template
* Create and configure global or template macroses:
  * {$ADAP_DISCOVERY_PERIOD} - adapters discovery period. I think you can set it nearly 1d (daily)
  * {$ADAP_HISTORY_PERIOD} - period of saving history for adapters data. For example 30d
  * {$ADAP_REQUEST_PERIOD} - period of requesting storage adapters data ( adapter,battery state, etc). 1h
  * {$INTERNAL_ITEMS_HISTORY_PEIOD} - period of source data for parsing items by json path. Usually 0, but for 
  debugging you can set it higher
  * {$LD_DISCOVERY_PERIOD} - logical discs discovery period. 6h
  * {$LD_HISTORY_PERIOD} - period of saving history for logical discs data. 30d
  * {$LD_REQUEST_PERIOD} - period of requesting logical discs data. 5m
  * {$PD_DISCOVERY_PERIOD} - physical discs discovery period. 30m
  * {$PD_HISTORY_PERIOD} - period of saving history for physical discs data. 30d
  * {$PD_REQUEST_PERIOD} - period of requesting physical discs data. 5m
   * {$ADAP_THROTTLING_HB_PERIOD} - period of heartbit for throttling for adapter data
   * {$LD_THROTTLING_HB_PERIOD} - period of heartbit for throttling for logical discs data
   * {$PD_THROTTLING_HB_PERIOD} - period of heartbit for throttling for physical discs data.
  
   ### Windows
  
  * Copy arcconf utility (you can use version in diskutils_windows.zip) in place where you store things like this
  * Copy adaptec_raid_win.conf in zabbix_agent configs folder
  * Copy adaptec.ps1 in zabbix_agent scripts folder
  * Edit arcconf paths in adaptec_raid_win.conf.
  * Copy arcconf.bat in zabbix_agent scripts folder if you are using the same scheme with data retrieval through "touch"
