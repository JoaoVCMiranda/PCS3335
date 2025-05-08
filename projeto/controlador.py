import serial
# Converter códigos numéricos para comandos no jogo

# Letra ASCII -> Se recebida torna-se um palpite
# Start 
# Select
# Seta para direita
# Seta para esquerda

ser = serial.Serial('/dev/serial0', 9600)
ser.flush()


