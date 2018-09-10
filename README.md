# KintaroNesCaseMod

## Mod your Kintaro NES case with a power LED in the front and a secure soft shutdown on/off button or switch.

This mod uses the Rpi 3 GPIOs 14 (TXD) (Pin 8) and GND (Pin 6) for the LED.<br>
For the button or in my case sliding switch the GPIO 3 (Pin 5) with the built in pull up resistor and GND (Pin 9) is used.

For testing the button on GPIO 3 the test-gpio.sh script could be used directly in a terminal via:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/master/test-gpio.sh)"
```
If the button gets pressed or switch gets slided you should see the output "Your button works :)" in the terminal.

If you are using retropie you can use the install-shutdown-service.sh script to add a startup service which executes the shutdown command when the button gets pressed or switch slided.<br>
Execute the script directly in terminal as root via:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/master/install-shutdown-service.sh)"
```
if you are using recalbox, it is even easier, because only one value needs to be commented out in the configuration:
```shell
system.power.switch=PIN356ONOFFRESET
```
Thats it. :smile: <p>

#### Work progress  :hourglass_flowing_sand::<p>
<h6>Testing :wrench:</h6>
<p align="left">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180907_020239.jpg" width="40%">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180907_180709.jpg" width="40%">
</p> 
<h6>Soldering :fire:</h6>
<p align="left">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180907_214423.jpg" width="40%">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180907_214438.jpg" width="40%">
</p>
<h6>Cut out the case  :scissors:</h6>
<p align="left">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180907_222336.jpg" width="40%">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180907_234856.jpg" width="40%">
</p> 
<h6>Glue the switch and LED and test again :wrench:</h6>
<p align="left">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180908_030525.jpg" width="40%">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180908_033252.jpg" width="40%">
</p>  
<h6>Wire everything up :curly_loop:</h6>
<p align="left">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180908_051716.jpg" width="40%">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180908_052458.jpg" width="40%">
</p>
<h6>Final result  :video_game::tada:</h6>
<p align="left">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180908_054238.jpg" width="40%">
<img src="https://raw.githubusercontent.com/schlegel11/KintaroNesCaseMod/assets/IMG_20180908_054315.jpg" width="40%">
</p>
