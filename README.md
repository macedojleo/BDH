# BDH - Monitoring your Unix/Linux File Systems manually or automatic way.  

BDH is an open source project developed using Shell Script and AWK languages allowing to the users a symple way to monitor Linux and Unix File Systems use through colors and visual messages. Besides that, the program allows the users run it in daemon mode and track each one FS usage history, configure threshold, and send alarm messages according to the need with no additional installation required.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

BDH needs Linux or Unix OS with BASH 4.1 (or higher), internet connection (to send alert messages), and a SLACK account with WebHook app installed to receive these messages. For further information about webhook app see https://api.slack.com/incoming-webhooks  

### Installing

Download bdh file and copy it in any directory which is in the system PATH.

To see which directories were set up in the system PATH, type the follows in the system terminal:

	$ echo $PATH

The output will be similar of the following:
	
	/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin

Choose one (usually is /usr/local/bin) and type:

	$ cp bdh <path directory>

DONE! bdh was successfully installed, use the command $ bdh -h to see the usage message.


## How to use (manually mode)

In the manually mode, the user's can check the all FS use using terminal and receive use alarms on the screen.

The commands and their options are:

	$ bdh -g or $ bdh -G show all FS as Gb values.
	$ bdh -m or $ bdh -M show all FS as Mb values.
	$ bdh -k or $ bdh -K show all FS as Kb values.

The visual alarms on the screen are:
	
	White fill -> NORMAL use according to threshold.
	Yellow fill -> MAJOR use according to threshold.
	Red fill -> CRITICAL use according to threshold.
	Flashing -> URGENT use according to threshold.
	
## How to use (Automatic mode)

In the automatic mode, bdh runs as daemon and monitore the FS automatically through previous specified periodic time (in seconds). When one or more FS reach to CRITICAL or URGENT threshold, an alarm will sent to SLACK using incoming WebHook messages app.

To START bdh as automatic (daemon) mode, type in the system terminal:

	$ bdh -d or bdh -D (interval in seconds) #eg. bdg -d 60 -> bdh check all FS use every minute (60 seconds).

To STOP bdh started as automatic (daemon) mode before, type in the systen terminal:

	$ bdh -s or bdh -S
	
## Log file (Only for Automatic mode)

When bdh starts in daemon mode, a log file named bdh_<timestamp>.log is created in a directory previously configured (see more in "how to configure bdh" topic to get more informations).

Basically the information displayed in bdh logfile are about START/STOP process, FS use in Kb, and each FS percentage of use as follows below:

	$cat /tmp/bdh_021819.log
	START  |  02/18/19-23:56:33 | Starting process in Deamon mode | PID:  9282 INTERVAL: 3600 | logFile: /tmp/bdh_021819.log
	INFO  |  02/19/19-13:33:56 | FS: tmpfs | Used: 32 kb | Free: 782368 kb | 1%
	CRITICAL  |  02/19/19-15:23:09 | FS: /dev/loop5 | Used: 80 kb | Free: 20 kb | 80%
	URGENT  |  02/19/19-15:23:09 | FS: /dev/loop8 | Used: 100 kb | Free: 0 kb | 100%
	STOP  |  02/19/19-15:23:10 | Process stoped byas  USER_NAME
 
If the user configures WebHook for Slack to receive HTTP requests (previous explained in Prerequisites topic), a Slack channel will received messages for CRITICAL and URGENT thresholds reached by File Systems. 
	

## How to configure bdh

To configure thresholds, open bdh script using a text editor your choice and replace the lines below by the values you need (remember, these values are in percent. E.g 70 means 70% of use). 

	#set alarm thresholds here:                                   

	Def_major="70"; #Change "70" for the value that you want for MAJOR threshold.
	Def_critical="85"; #Change "85" for the value that you want CRITICAL threshold.
	Def_urgent="95"; #Change "95" for the value that you want URGENT threshold.
	
* This configuration is valid for both alerts, manually and automatic mode.	

To configure WebHook URL to allow Slack receives messages sent by bdh, change the value of variable below:

		SlackWebHook="INSERT YOUR WEBHOOK URL HERE"

To change the directory where bdh will write the log file, change the value of the variable below:

	#Change here logdir (log will be generated only in daemon mode).
	logdir="/tmp"
	
* This variable is set up into the log function.

## Author

* **Leonardo Macedo** - *Linux SYSADM, IT Consultant. DevOps, Python and Shell script developer* - macedojleo@gmail.com

If you like this project, please mark the star! I will be very grateful! :)

