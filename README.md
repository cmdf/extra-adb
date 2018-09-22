Run shortcut adb commands in Windows Console.
> 1. Download [zip file](https://github.com/cmdf/extra-adb/releases/download/1.0.0/eadb.zip).
> 2. Extract it to `C:\Program_Files\Scripts`.
> 3. Add `C:\Program_Files\Scripts` to `PATH` environment variable.


### devices

```batch
> eadb devices [--adb|-a] [--fastboot|-f] [--specific|-s]
```

```batch
:: list all devices
> eadb devices

:: list adb devices
> eadb devices -a

:: list fastboot devices
> eadb devices -f

:: list particular device (if available)
> set ANDROID_SERIAL=badb05
> eadb devices -s
```


### flash

#### rom

```batch
> eadb flash rom [--system|-s] [--userdata|-u] [--recovery|-r] [--persist|-p] [--cache|-c] [--boot|-b] [--aboot|-a]
```

```batch
:: flash rom build images
> eadb flash rom

:: flash rom build images to specific device
> set ANDROID_SERIAL=badb05
> eadb flash rom

:: flash system and userdata rom build images
> eadb flash rom -su
```


### log

#### cat

```batch
> eadb log cat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
```

```batch
:: get logcat to logcat.log
> eadb log cat

:: get logcat to logcat2.log
> eadb log cat -o logcat2.log

:: get crash and kernel log with threadtime logcat to logcat3.log
> eadb logcat -ckto logcat3.log
```


#### kmsg

```batch
> eadb log kmsg [--out|-o <file>]
```

```batch
:: get kernel message log to kmsg.log
> eadb log kmsg

:: get kernel message log to kmsg2.log
> eadb log kmsg -o kmsg2.log
```


#### systrace

```batch
> eadb log systrace [--time|-t <time>] [--out|-o <file>]
```

```batch
:: get 30s systrace to systrace.html
> eadb log systrace

:: get 10s systrace to systrace.html
> eadb log systrace -t 10

:: get 20s systrace to systrace2.html
> eadb log systrace -t 10 -o systrace2.html
```


#### trace_pipe

```batch
> eadb log trace_pipe [--out|-o <file>] [<args>...]
:: trace events need to enabled first
```

```batch
:: get trace event logs to trace_pipe.log
> eadb log trace_pipe

:: get trace event logs to trace_pipe2.log
> eadb log trace_pipe -o trace_pipe2.log
```

### logcat

```batch
> eadb logcat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
:: this is same as "eadb log cat"
```


### root

```batch
> eadb root [--remount|-r] [--setenforce|-s] [--verity-disable|-v]
```

```batch
:: set adb in root mode, remount and setenforce
> eadb root

:: set adb in root mode, remount, setenforce and disable verity
> eadb root -r -s -v

:: set adb in root mode and remount
> eadb root --remount

:: set adb in root mode
> eadb root .
```


### shell

#### lock

```batch
> eadb shell lock
```

```batch
:: lock the device
> eadb shell lock
```


#### restart

```batch
> eadb shell restart
```

```batch
:: restart shell
> eadb shell restart
```


#### screencap

```batch
> eadb shell screencap [--out|-o <file>]
```

```batch
:: capture screen to screencap.png
> eadb shell screencap

:: capture screen to screencap2.png
> eadb shell screencap -o screencap2.png
```


#### unlock

```batch
> eadb shell unlock
```

```batch
:: unlock the device
> eadb shell unlock
```


### wait-for-device

```batch
> eadb wait-for-device
```

```batch
:: wait for device to be in adb mode
> eadb wait-for-device

:: switch fastboot device to adb mode and wait till available
> eadb wait-for-device

:: wait for specific device to be in adb mode
> set ANDROID_SERIAL=badb05
> eadb wait-for-device
```


### wait-for-fastboot

```batch
> eadb wait-for-fastboot
```

```batch
:: wait for device to be in fastboot mode
> eadb wait-for-fastboot

:: switch adb device to fastboot mode and wait till available
> eadb wait-for-fastboot

:: wait for specific device to be in fastboot mode
> set ANDROID_SERIAL=badb05
> eadb wait-for-fastboot
```


[![cmdf](https://i.imgur.com/7dOgljF.jpg)](https://cmdf.github.io)
