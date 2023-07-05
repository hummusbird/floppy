import I2C_LCD_driver
from time import *
import sys

lcd = I2C_LCD_driver.lcd()

str_pad = " " * 16
input = sys.stdin.read().split("***")
input.append("")
inputstring = input[0].rstrip()
inputstring = str_pad + inputstring

bot = input[1].rstrip()
botpadlen = (16 - len(bot)) / 2
botpadstr = " " * botpadlen + bot + " " * botpadlen
lcd.lcd_display_string(botpadstr, 2)

while True:
    for i in range (0, len(inputstring)):
        lcd_text = inputstring[i:(i+16)]
        lcd.lcd_display_string(lcd_text,1)
        sleep(0.4)
        lcd.lcd_display_string(str_pad,1)
