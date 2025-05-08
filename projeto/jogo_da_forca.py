from unicodedata import normalize

class Forca:
   
    def __init__(self, palavra, vidas, dica):
        self.banner1 = "**** JOGO DA FORCA ****"
        self.banner2 = "*** cheira a suco ? ***"

        self.win1 = "Você não é de suco"
        self.win2 = "*** Parabéns!!! ***"

        self.lose1 = "Você cheira a suco"
        self.lose2 = "* Tente novamente *"
 
        self.palavraOriginal = palavra
        self.palavra = normalize('NFKD', palavra).encode('ASCII', 'ignore').decode('utf-8').upper()
        self.vidas = vidas
        self.pontos = 0
        self.streak = 0
        self.palpites = []
        self.multiplicador = 1
        self.status = 1
        self.posicoesCertas = [0]*len(palavra)
        self.dica = dica
        self.selectValue = 0


    def getVidas(self):
        return self.vidas

    def getPosicoesLetra(self, letra):
        posicoes  = []
     
        for i,c in enumerate(self.palavra):
            if letra == c:
                posicoes.append(i)
        return posicoes
    
    def getMultiplicador(self):
        return (self.multiplicador+self.streak)

    def palpite(self, letra):
        self.status = 2
        self.palpites.append(letra.upper()) 
        posicoes = self.getPosicoesLetra(letra)
        
        if len(posicoes) > 0 :
            for p in posicoes:
                self.posicoesCertas[p] = 1

            self.pontos = len(posicoes)*self.getMultiplicador()
            self.streak += 1
        else: 
            self.vidas -= 1
            self.streak = 0
        if(sum(self.posicoesCertas) == len(self.palavra)):
            self.status = 3

        if(self.vidas == 0):
            self.status = 4

    def select(self):
        self.selectValue = (self.selectValue + 1)%3

    def jogo(self):
        ans = []
        for i,p in enumerate(self.posicoesCertas):
            if p:
                ans.append(self.palavraOriginal[i])
            else:
                ans.append("_")
        return " ".join(ans)

    def linha1(self):
        match self.status:
            case 1:
                return self.banner1
            case 2:
                return self.jogo()
            case 3:
                return self.win1
            case 4:
                return self.lose1

    def linha2(self):
        if self.status == 1:
            return self.banner2
        if self.status == 3:
            return self.win2
        if self.status == 4:
            return self.lose2

        match self.selectValue:
            case 0:
                return " ".join(self.palpites) 
            case 1:
                return " ".join(["♥	" for x in range(self.vidas)])
            case 2:
                return f"Dica: {self.dica}"
            case _:
                return " ".join(self.palpites)
def interativo(jogo):
    op = 1
    while op:
        print("Escolha uma ação: ")
        print("(1) Palpite")
        print("(2) Select")
        op = int(input(":"))
        match op:
            case 0:
                pass
            case 1:
                jogo.palpite(input('Palpite: '))
            case 2:
                jogo.select()
        print(jogo.linha1())
        print(jogo.linha2())

if __name__ == "__main__":
    jogo = Forca("Melancia", 3, "Fruta")
    interativo(jogo)
    win = True

    # TODO: 
    # - Overflow de letras - Pegar apenas as mais recentes
    # - Mostrar a palavra completa no final do jogo
    # - Letras repetidas ? 
    # - Implementar modo "eu sei a resposta"

    print(jogo.linha1())
    print(jogo.linha2())
    print()

    jogo.palpite('M')

    print(jogo.linha1())
    print(jogo.linha2())
    print()


    jogo.palpite('A')

    print(jogo.linha1())
    print(jogo.linha2())
    print()


    jogo.select()
    
    print(jogo.linha1())
    print(jogo.linha2())
    print()

    jogo.palpite('X')

    print(jogo.linha1())
    print(jogo.linha2())
    print()


    jogo.palpite('Y')

    print(jogo.linha1())
    print(jogo.linha2())
    print()


    jogo.select()

    print(jogo.linha1())
    print(jogo.linha2())
    print()


    jogo.select()

    print(jogo.linha1())
    print(jogo.linha2())
    print()

    jogo.palpite('E')

    print(jogo.linha1())
    print(jogo.linha2())
    print()

    jogo.palpite('C')

    print(jogo.linha1())
    print(jogo.linha2())
    print()

    jogo.palpite('I')

    print(jogo.linha1())
    print(jogo.linha2())
    print()

    jogo.palpite('N')

    print(jogo.linha1())
    print(jogo.linha2())
    print()
    
    if win:
        jogo.palpite('L')
    else:
        jogo.palpite('Z')

    print(jogo.linha1())
    print(jogo.linha2())
    print()

    
