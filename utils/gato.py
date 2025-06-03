import serial
import time

# Configurações da porta serial
# A porta serial principal na Raspberry Pi é geralmente '/dev/ttyS0' (em modelos mais novos)
# ou '/dev/ttyAMA0' (em modelos mais antigos ou se você não desabilitou o console).
# Verifique qual a sua porta serial principal.
# Você pode listar as portas seriais disponíveis com 'ls /dev/tty*'
PORTA_SERIAL = '/dev/ttyS0'
BAUD_RATE = 9600  # A taxa de baud deve ser a mesma do dispositivo que está enviando os dados

try:
    # Abre a porta serial
    ser = serial.Serial(
        port=PORTA_SERIAL,
        baudrate=BAUD_RATE,
        parity=serial.PARITY_NONE,
        stopbits=serial.STOPBITS_ONE,
        bytesize=serial.EIGHTBITS,
        timeout=1 # Timeout de leitura em segundos
    )

    print(f"Porta serial {PORTA_SERIAL} aberta com sucesso a {BAUD_RATE} baud.")
    print("Aguardando dados...")

    while True:
        if ser.in_waiting > 0:
            # Lê todos os bytes disponíveis na porta serial
            # .read() lê um número específico de bytes
            # .readline() lê até um caractere de nova linha '\n'
            # .read_until() lê até um determinado terminador
            # .read_all() lê todos os bytes disponíveis (bloqueia até o timeout se nenhum dado chegar)

            # Para ler uma linha (espera por '\n')
            # dados_recebidos = ser.readline().decode('utf-8').strip()

            # Para ler todos os bytes disponíveis
            dados_recebidos_bytes = ser.read(ser.in_waiting)
            dados_recebidos = dados_recebidos_bytes.decode('utf-8', errors='ignore').strip()

            if dados_recebidos:
                print(f"Dados recebidos: '{dados_recebidos}'")

        time.sleep(0.1) # Pequeno atraso para evitar sobrecarga da CPU

except serial.SerialException as e:
    print(f"Erro ao abrir ou operar a porta serial: {e}")
    print("Verifique se a porta serial está correta e se você tem permissão.")
    print("Você pode precisar adicionar seu usuário ao grupo 'dialout': sudo adduser <seu_usuario> dialout")

except KeyboardInterrupt:
    print("\nLeitura serial interrompida pelo usuário.")

finally:
    if 'ser' in locals() and ser.is_open:
        ser.close()
        print("Porta serial fechada.")
