# cmd-adb

Run shortcut adb commands in Windows Console.


## setup

```batch
:: clone
> git clone https://github.com/0rez/cmd-adb.git

:: add to path
> cd cmd-adb
> setx /m path=%path%;%cd%
```


## usage

### devices

```batch
> oadb devices [--adb|-a] [--fastboot|-f] [--specific|-s]
```

```batch
:: list all devices
> oadb devices

:: list adb devices
> oadb devices -a

:: list fastboot devices
> oadb devices -f

:: list particular device (if available)
> set ANDROID_SERIAL=badb05
> oadb devices -s
```


### flash

#### rom

```batch
> oadb flash rom [--system|-s] [--userdata|-u] [--recovery|-r] [--persist|-p] [--cache|-c] [--boot|-b] [--aboot|-a]
```

```batch
:: flash rom build images
> oadb flash rom

:: flash rom build images to specific device
> set ANDROID_SERIAL=badb05
> oadb flash rom

:: flash system and userdata rom build images
> oadb flash rom -su
```


### log

#### cat

```batch
> oadb log cat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
```

```batch
:: get logcat to logcat.log
> oadb log cat

:: get logcat to logcat2.log
> oadb log cat -o logcat2.log

:: get crash and kernel log with threadtime logcat to logcat3.log
> oadb logcat -ckto logcat3.log
```


#### kmsg

```batch
> oadb log kmsg [--out|-o <file>]
```

```batch
:: get kernel message log to kmsg.log
> oadb log kmsg

:: get kernel message log to kmsg2.log
> oadb log kmsg -o kmsg2.log
```


#### systrace

```batch
> oadb log systrace [--time|-t <time>] [--out|-o <file>]
```

```batch
:: get 30s systrace to systrace.html
> oadb log systrace

:: get 10s systrace to systrace.html
> oadb log systrace -t 10

:: get 20s systrace to systrace2.html
> oadb log systrace -t 10 -o systrace2.html
```


#### trace_pipe

```batch
> oadb log trace_pipe [--out|-o <file>] [<args>...]
:: trace events need to enabled first
```

```batch
:: get trace event logs to trace_pipe.log
> oadb log trace_pipe

:: get trace event logs to trace_pipe2.log
> oadb log trace_pipe -o trace_pipe2.log
```

### logcat

```batch
> oadb logcat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
:: this is same as "oadb log cat"
```


### root

```batch
> oadb root [--remount|-r] [--setenforce|-s] [--verity-disable|-v]
```

```batch
:: set adb in root mode, remount and setenforce
> oadb root

:: set adb in root mode, remount, setenforce and disable verity
> oadb root -r -s -v

:: set adb in root mode and remount
> oadb root --remount

:: set adb in root mode
> oadb root .
```


### shell

#### lock

```batch
> oadb shell lock
```

```batch
:: lock the device
> oadb shell lock
```


#### restart

```batch
> oadb shell restart
```

```batch
:: restart shell
> oadb shell restart
```


#### screencap

```batch
> oadb shell screencap [--out|-o <file>]
```

```batch
:: capture screen to screencap.png
> oadb shell screencap

:: capture screen to screencap2.png
> oadb shell screencap -o screencap2.png
```


#### unlock

```batch
> oadb shell unlock
```

```batch
:: unlock the device
> oadb shell unlock
```


### wait-for-device

```batch
> oadb wait-for-device
```

```batch
:: wait for device to be in adb mode
> oadb wait-for-device

:: switch fastboot device to adb mode and wait till available
> oadb wait-for-device

:: wait for specific device to be in adb mode
> set ANDROID_SERIAL=badb05
> oadb wait-for-device
```


### wait-for-fastboot

```batch
> oadb wait-for-fastboot
```

```batch
:: wait for device to be in fastboot mode
> oadb wait-for-fastboot

:: switch adb device to fastboot mode and wait till available
> oadb wait-for-fastboot

:: wait for specific device to be in fastboot mode
> set ANDROID_SERIAL=badb05
> oadb wait-for-fastboot
```
