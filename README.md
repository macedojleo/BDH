Table of contents
=================

<!--ts-->
   * [Prerequisites](#prerequisites)
   * [Installing](#installing)
   * [Defining thresholds](#thresholds)
   * [BDH - visual mode](#manually)
   * [BDH - Deamon Mode](#automatic)
   * [BDH Log](#log)
   * [Configure Webhook App for Slack](#webhook)
<!--te-->

### [Prerequisites](#prerequisites)

- Incoming Webhook slack's add-on. 

### [Installing](#installing)

- Clone the project here: [zip file](https://github.com/macedojleo/BDH/zipball/master) or [tarball](https://github.com/macedojleo/BDH/tarball/master).

- Move BDH script to any directory PATH.

- Use ```$ bdh -h``` in order to valide it works.

### [Defining thresholds](#thresholds)

Open BDH file using your favorite text editor and change those lines in order to customize the thresholds and its alerts:

 	Def_major="70";
 	Def_critical="85";
 	Def_urgent="95";

### [BDH - visual mode](#manually)

Use **BDH** with one of these options [-k |-K (Kbytes), -m | -M (Mbytes), or -g | -G (Gbytes)] to show the current FS usage.

```$ bdh -g or $ bdh -G```
```$ bdh -m or $ bdh -M```
```$ bdh -k or $ bdh -K```

The Filesystems usage will show on the screen as follows:

- **NORMAL** threshold FS usage is showing as default color.
- **MAJOR** threshold FS usage is showing as yellow.
- **CRITICAL** threshold FS usage is showing as red.
- **URGENT** threshold FS usage is showing flashing.

![Sample](/docs/sample.gif)

## [BDH - Deamon Mode](#automatic)

Using BDH with -d option will start the process in deamon mode. In this mode, BDH uses **[Slack](#webhook)** to notify the moment of FS usage reachs to **critical** or **Urgent** threshold.  

![SlackMessages](/docs/SlackExampleMessages.png)

### Starting BDH in deamon mode

```$ bdh -d <interval in seconds> or $ bdh -D <interval in seconds>```


### Stop BDH in deamon mode

```$ bdh -s```	

### Slack messages examples

- **CRITICAL** alarm message is identified by a :bomb: icon:

![SlackCritical](/docs/slackCriticalMessage.png)

- **URGENT** alarm message  is identified by a :fire: icon:

![SlackUrgent](/docs/slackUrgentMessage.png)


## [BDH Log](#log)

Log files are generated by BDH process only in deamon mode and it stores piece of information such as Start, Stop, info, and alarm messages.

	START  |  02/18/19-23:56:33 | Starting process in Deamon mode | PID:  9282 INTERVAL: 3600 | logFile: /tmp/bdh_021819.log
	INFO  |  02/19/19-13:33:56 | FS: tmpfs | Used: 32 kb | Free: 782368 kb | 1%
	CRITICAL  |  02/19/19-15:23:09 | FS: /dev/loop5 | Used: 80 kb | Free: 20 kb | 80%
	URGENT  |  02/19/19-15:23:09 | FS: /dev/loop8 | Used: 100 kb | Free: 0 kb | 100%
	STOP  |  02/19/19-15:23:10 | Process stopped by LEONARDO MACEDO 
	

### [Configure Webhook App for Slack](#webhook)

You need configure **WebHook** in order to allow **Slack** receive incoming messages.

1. Access incoming-webhooks page [Here](https://api.slack.com/incoming-webhooks) and follow the instructions.

2. Change the variable **SlackWebHook** in BDH file using the Webhook URL you've got.

	SlackWebHook="INSERT YOUR WEBHOOK URL HERE"
	
3. Run BDH in [deamon mode](#automatic)
