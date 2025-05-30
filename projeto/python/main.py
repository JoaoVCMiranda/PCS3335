"""
Para usar essa classe,

O display deve ser ligado na pi e a recepção serial será feita pelo GPIO = 15
"""
import serial
import time
import datetime
import lcd_display

ser = serial.Serial(

      '/dev/serial0',
      9600,
      parity=serial.PARITY_NONE,
      stopbits=serial.STOPBITS_ONE,
      bytesize=serial.EIGHTBITS,
      timeout=1
)
def setup():
    lcd_display.setupGPIO()
    lcd_display.lcd_init()

def plot(linha1, linha2):
  lcd_display.lcd_string(linha1, lcd_display.LCD_LINE_1)
  lcd_display.lcd_string(linha2, lcd_display.LCD_LINE_2)

# Inicializar o display
setup()
linha1 = ''
linha2 = ''

linha = ''
contador = 0

start = '\t'
end = '\n'

while 1:
  char = ser.flush()
  print(datetime.datetime.now().strftime("%S"),char)

  if(char == start):
    contador = 1

  if(contador != 0)
    linha += char

  if(char == end and contador == 1):
    linha1 = linha
    contador = 2
    linha = ''
  if(char == end and contador == 2):
    linha2 = linha
    contador = 0
    linha = ''
    plot(linha1, linha2)
