from jogo_da_forca import Forca
import lcd_display
import csv
import random


dictlvl1 = []
dictlvl2 = []
dictlvl3 = []

def setup():
    lcd_display.setupGPIO()
    lcd_display.lcd_init()
    with open('lvl1.txt', 'r', encoding='utf-8') as lvl1:
        for x in list(csv.reader(lvl1)):
            dictlvl1.append(x)
    
    with open('lvl2.txt', 'r', encoding='utf-8') as lvl2:
        for x in list(csv.reader(lvl2)):
            dictlvl2.append(x)

    with open('lvl3.txt', 'r', encoding='utf-8') as lvl3:
        for x in list(csv.reader(lvl3)):
            dictlvl3.append(x)

def plot(linha1, linha2):
    lcd_display.lcd_string(linha1, lcd_display.LCD_LINE_1)
    lcd_display.lcd_string(linha2, lcd_display.LCD_LINE_2)

if __name__ == '__main__':
    setup()

    jogo = ""
     
    while True:
        if type(jogo) is str:
            plot("Dificuldade", "1 2 3")
            dificuldade = int(input())
            dicio = ""
            vidas = 1
            match dificuldade:
                case 1:
                    dicio = dictlvl1
                    vidas = 5
                case 2:
                    dicio = dictlvl2
                    vidas = 3
                case 3:
                    dicio = dictlvl3
                    vidas = 2
                case _:
                    dicio = dictlvl3

            par = random.choice(dicio)
            jogo = Forca(par[0], vidas, par[1])
        l1 = jogo.linha1()
        l2 = jogo.linha2()
        plot(l1,l2)
        print(l1)
        print(l2)
        comando = input()[0]
        # Acabou o jogo
        if(jogo.status == 4 or jogo.status == 5):
            jogo = ""
            pass
        if('A' <= comando <= 'Z'):
            jogo.palpite(comando)
        match comando:
            case 'l':
                jogo.select()
