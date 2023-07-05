import I2C_LCD_driver
import sys

lcd = I2C_LCD_driver.lcd()

input = sys.stdin.read().split("***")
input.append("")
top = input[0].rstrip()
bot = input[1].rstrip()

toppadlen = (16 - len(top)) / 2
toppadstr = " " * toppadlen + top + " " * toppadlen

botpadlen = (16 - len(bot)) / 2
botpadstr = " " * botpadlen + bot + " " * botpadlen

lcd.lcd_display_string(toppadstr, 1)
lcd.lcd_display_string(botpadstr, 2)
