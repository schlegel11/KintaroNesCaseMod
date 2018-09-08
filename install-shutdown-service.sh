#!/bin/bash

#Check for root
if [[ $EUID -ne 0 ]]; then
   echo "No root user -> Run script as root" 1>&2
   exit 1
fi

#Check for python
if ! hash python 2>/dev/null; then
   echo "No python found -> Install python"
   exit 1
fi

#Check for python module
if ! python -c 'import RPi.GPIO' 2>/dev/null; then
   echo "No RPi.GPIO python module found -> Install python module RPi.GPIO"
   exit 1
fi

#Check if shutdown script already exists
if [ -e /usr/local/bin/gpio3-shutdown.py ]
then
    echo "Script with name \"gpio3-shutdown\" already exists"
    exit 1
fi

#Check if shutdown service already exists
if [ -e /etc/init.d/gpio3-shutdown.sh ]
then
    echo "Service with name \"gpio3-shutdown\" already exists"
    exit 1
fi

echo "Write shutdown script to /usr/local/bin/gpio3-shutdown.py"
echo

#Write shutdown script
echo '#!/usr/bin/env python

import RPi.GPIO as GPIO
import subprocess

GPIO.setmode(GPIO.BCM)
# Disable warning about gpio3 and its resistor.
GPIO.setwarnings(False)
# Gpio3 uses a hardware based pul up resistor.
GPIO.setup(3, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.wait_for_edge(3, GPIO.FALLING)

subprocess.call(["shutdown", "-h", "now"])' > /usr/local/bin/gpio3-shutdown.py

echo "Make shutdown script executable"
echo

#Make shutdown script executable
chmod +x /usr/local/bin/gpio3-shutdown.py

echo "Write shutdown service to /etc/init.d/gpio3-shutdown.sh"
echo

#Write shutdown service
echo '#! /bin/sh

### BEGIN INIT INFO
# Provides:          gpio3-shutdown.py
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Shutdown service
# Description:       Run GPIO3 shutdown service
### END INIT INFO


case "$1" in
  start)
    echo "Starting gpio3-shutdown.py"
    /usr/local/bin/gpio3-shutdown.py
    ;;
  stop)
    echo "Stopping gpio3-shutdown.py"
    pkill -f /usr/local/bin/gpio3-shutdown.py
    ;;
  *)
    echo "Usage: /etc/init.d/gpio3-shutdown.sh {start|stop}"
    exit 1
    ;;
esac

exit 0' > /etc/init.d/gpio3-shutdown.sh

echo "Make shutdown service executable"
echo

#Make shutdown service executable
chmod +x /etc/init.d/gpio3-shutdown.sh

echo "Add shutdown service to services"
echo

#Add shutdown service to services
update-rc.d gpio3-shutdown.sh defaults

echo "Start shutdown service"
echo

#Start shutdown service
/etc/init.d/gpio3-shutdown.sh start

