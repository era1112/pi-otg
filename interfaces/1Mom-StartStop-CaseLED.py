from gpiozero import Button
from subprocess import call
from signal import pause

# Set the GPIO pin number
button_pin = 4		# AKA Pin 7

# Create a Button object
button = Button(button_pin)

# Define the function to be executed when the button is pressed
def button_pressed():
    print("Launching payload")
    call(["/home/pi/Documents/pi-otg/payload.sh"])

# When the button is pressed, call the button_pressed() function
button.when_pressed = button_pressed

# Prevents flow from reaching end of script
pause()
