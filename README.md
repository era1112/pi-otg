# pi-otg
raspberry pi loadout for led and pushbutton control while on the move

Flow of control:
- systemctl runs "pi-otg.service" at boot, which is responsible for keeping "interface.py" (symlink to the interface script you really want) running at all times.
- the interface script polls on GPIO and calls "payload.sh" (symlink to the actual desired payload script) when the desired trigger is met (gpio, time, gps, whatever).
- the payload script carries out the system functions when in the triggered state.

Project layout:
- interface.py and payload.sh are symlinks that you alter when you want a different trigger interface or payload
- the interfaces and payloads folders have interfaces and payloads to choose from

Docs:
- main documentation is the docx at top level, although the project deviates some names and details

Future:
- add protection against multiple-execution of the payload
- add on/off functionality of payload by pressing button
- add LED indication of status
