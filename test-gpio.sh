#!/bin/bash


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

echo "Execute test script"
echo

#Execute test script
python -c '
import RPi.GPIO as GPIO
import subprocess

GPIO.setmode(GPIO.BCM)
GPIO.setup(3, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.wait_for_edge(3, GPIO.FALLING)

subprocess.call(["echo", "Your button works :)"])'
