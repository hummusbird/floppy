import I2C_LCD_driver
import sys

lcd = I2C_LCD_driver.lcd()
topstring = sys.stdin.read().split("\n")[0]
bottomstring = sys.stdin.read().split("\n")[1]

lcd.lcd_display_string(topstring, 1)
lcd.lcd_display_string(bottomstring, 2)
