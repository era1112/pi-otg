# pi-otg
raspberry pi loadout for led and pushbutton control while on the move

Use case:
- Drive around town with your raspberry pi and push a gpio-connected button to run your script.
- For when a single button is easier to use than bringing a keyboard & screen.

Setup:
- Make "main.sh" (symlink) point at the script you want to run when you push the button (from /scripts/).
- Make "interface.sh" (symlink) point to the script in /interfaces/ that defines the button/led behavior you want, connect pushbutton and LEDs to appropriate gpio pin.
- set up systemctl to keep interface.sh running:
  - copy pi-otg.service to /etc/systemd/system
  - run the service, this should make it stay on across reboots: ```sudo systemctl start pi-otg.service```
  - check the service is running: ```sudo systemctl status pi-otg.service```
- reboot pi, push the button, your script will run

Flow of control:
- systemctl runs "pi-otg.service" at boot, which is responsible for keeping "interface.py" (symlink to the interface script you really want) running at all times.
- "interface.py" polls on GPIO and calls "main.sh" (symlink to the actual desired payload script) when the desired trigger is met (gpio, time, gps, whatever).
- 'main.sh" carries out the system functions when in the triggered state.

Project layout:
- interface.py and main.sh are symlinks that you alter when you want a different IO interface or executable script
- the interfaces and scripts folders have interfaces and payloads to choose from

Documentation:
- This readme
- further detail is based in the .docx at top level, although the project has grown from that doc and deviates some names and details

Dependencies:
- python3, gpiozero

Future:
- add protection against multiple-execution of the main script
- add on/off/ functionality for the main script by pressing button
- add LED indication of script status
