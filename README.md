# [BDH - MONITORING UNIX/LINUX FILE SYSTEMS MANUALLY OR AUTOMATICALLY WAY](#intro)  

BDH is an open source project developed using Shell Script and AWK languages allowing to the users a symple way to monitor Linux and Unix File Systems usage through colors and visual messages. Besides that, the program allows the users to run BDH as daemon mode to track each one FS usage history, configure usage thresholds, and send alarm messages according to the need with no additional installation required.

Table of contents
=================

<!--ts-->
   * [INTRO](#intro)	
   * [Getting Started](#Getting Started)
   * [Prerequisites](#prerequisites)
   * [Installing](#installing)
   * [How to use bdh in manually mode](#manually)
   * [How to use bdh in automatic mode](#automatic)
   * [Log file](#log)
   * [Author](#author)
   
<!--te-->

## [Getting Started](#getting-started)

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### [Prerequisites](#prerequisites)

BDH needs Linux or Unix OS with BASH 4.1 (or higher), internet connection (to send alert messages), and a SLACK account with WebHook app installed. For further information to install Webhook app at Slack and how to generate HTTPS URL click [here](https://api.slack.com/incoming-webhooks)  

### [Installing](#installing)

Download bdh file and copy it in any directory which is in the system PATH.

To see which directories were set up in the system PATH, type the follows in the system terminal:

	$ echo $PATH

The output will be similar of the following:
	
	/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin

Choose one (usually is /usr/local/bin) and type:

	$ cp bdh <path directory>

DONE! bdh was successfully installed, run the command $ bdh -h to get usage message.


## [How to use bdh (manually mode)](#manually)

In the manually mode, the user's can check the all FS use using terminal and receive use alarms on the screen.

The commands and their options are:

	$ bdh -g or $ bdh -G show all FS as Gb values.
	$ bdh -m or $ bdh -M show all FS as Mb values.
	$ bdh -k or $ bdh -K show all FS as Kb values.

The visual alarms on the screen means as follows:
	
	White fill -> The FS usage is NORMAL according to the thresholds configurations.
	Yellow fill -> The FS reached to MAJOR usage according to the threshold configurations.
	Red fill -> The FS reached to CRITICAL usage according to the threshold configurations.
	Flashing -> The FS reached to URGENT usage according to the threshold configurations.
	
![Sample](/docs/sample.gif)
	
## [How to use bdh (Automatic mode)](#automatic)

In the automatic mode, bdh runs as daemon and monitore the FS automatically through previous specified periodic time (in seconds). When one or more FS reach to CRITICAL or URGENT threshold, an alarm will sent to SLACK using incoming WebHook messages app.

![SlackMessages](/docs/SlackExampleMessages.png)

To START bdh as automatic (daemon) mode, type in the system terminal:

	$ bdh -d or bdh -D (interval in seconds) #eg. bdg -d 60 -> bdh check all FS use every minute (60 seconds).

To STOP bdh started as automatic (daemon) mode before, type in the systen terminal:

	$ bdh -s or bdh -S
	
Example of CRITICAL alarm message sent to some slack #CHANNEL by bdh -d process:

![SlackCritical](/docs/slackCriticalMessage.png)

Example of URGENT alarm message sent to some slack #CHANNEL by bdh -d process:

![SlackUrgent](/docs/slackUrgentMessage.png)

## [Log file (Only for Automatic mode)](#log)

When bdh starts in daemon mode, a log file named bdh_<timestamp>.log is created in a directory previously configured (see more in "how to configure bdh" topic to get more informations).

Basically the information displayed in bdh logfile are about START/STOP process, each FS usage in Kb, and percentage as follows below:

	$cat /tmp/bdh_021819.log
	START  |  02/18/19-23:56:33 | Starting process in Deamon mode | PID:  9282 INTERVAL: 3600 | logFile: /tmp/bdh_021819.log
	INFO  |  02/19/19-13:33:56 | FS: tmpfs | Used: 32 kb | Free: 782368 kb | 1%
	CRITICAL  |  02/19/19-15:23:09 | FS: /dev/loop5 | Used: 80 kb | Free: 20 kb | 80%
	URGENT  |  02/19/19-15:23:09 | FS: /dev/loop8 | Used: 100 kb | Free: 0 kb | 100%
	STOP  |  02/19/19-15:23:10 | Process stoped by LEONARDO MACEDO
 
If the user configures WebHook for Slack to receive HTTP requests (previous explained in Prerequisites topic), a Slack channel will received messages sent by bdh -d process for CRITICAL and URGENT usage thresholds reached by File Systems. 
	

## [How to configure bdh](#configure)

To configure thresholds, open bdh script using a text editor your choice and replace the lines below by the values you prefer Remember: All these values were setted up using percent format. (e.g. the number "70" means "70%" of FS usage). 

	#set alarm thresholds here:                                   

	Def_major="70"; #Set value that you want for the FS usage MAJOR threshold.
	Def_critical="85"; #Set value that you want for the FS usage CRITICAL threshold.
	Def_urgent="95"; #Set value that you want for the FS usage URGENT threshold.
	
*PS: This configuration is valid for both, manually and automatic modes.	

To configure WebHook URL to allow Slack receives messages sent by bdh process, change variable value below setting URL Webhook:

	SlackWebHook="INSERT YOUR WEBHOOK URL HERE"

To change the directory where bdh will write the log file, change the variable value below:

	#Change here logdir (log will be generated only in daemon mode).
	logdir="/tmp"
	
* This variable must be set up into the log function.

## [Author](#author)

* **Leonardo Macedo** - *Linux SYSADM, IT Consultant. DevOps, Python and Shell script developer* - macedojleo@gmail.com

