from gpiozero import Button
from signal import pause

def say_hello(button):
    print(button.pin)

def say_goodbye():
    print("Goodbye!")

button1 = Button(4)

button1.when_pressed = say_hello
button1.when_released = say_goodbye

pause()
