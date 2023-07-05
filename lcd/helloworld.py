import I2C_LCD_driver
from time import *
lcd = I2C_LCD_driver.lcd()
lcd.lcd_display_string("FUCK YOU <3", 1)
lcd.lcd_display_string("@miaowing", 2)
