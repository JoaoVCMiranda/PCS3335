from jogo_da_forca import Forca
import lcd_display

def setup():
    lcd_display.setupGPIO()
    lcd_display.lcd_init()
def plot(linha1, linha2):
    lcd_display.lcd_string(linha1, lcd_display.LCD_LINE_1)
    lcd_display.lcd_string(linha2, lcd_display.LCD_LINE_2)

if __name__ == '__main__':
    jogo1 = Forca("Abacaxi", 1)
    jogo2 = Forca("Romã", 2)
    jogo3 = Forca("Maçã", 3)

    # Cada jogo aceita como palpites apenas letras maiúsculas
    # TODO:
    # - Implementar lista de palavras
    # - Implementar dificuldade
    # - Ler o status para saber quando destruir o objeto
    # - A função "interativo" do pacote jogo_da_forca deve ser implementada aqui com modificacoes
