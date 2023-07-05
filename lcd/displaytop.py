import I2C_LCD_driver
import sys

lcd = I2C_LCD_driver.lcd()

input = sys.stdin.read().rstrip()

padlen = (16 - len(input)) / 2
print(padlen)
paddedstr = " " * padlen + input + " " * padlen
print(paddedstr)
lcd.lcd_display_string(paddedstr, 1)
