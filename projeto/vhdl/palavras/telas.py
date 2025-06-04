import pandas as pd
import re
telas = []

# Start Screen
start_screen = ['*JOGO DA FORCA*', 'cheira a suco ?']
telas.append(start_screen)
# Win
win = ['Vc n eh de suco!', '**Parabéns!!!!**']
telas.append(win)
# lose
lose = ['Vc cheira a suco', 'Tente novamente!']
telas.append(lose)

telas.append(['  Dificuldade   ','<-    Facil   ->'])
telas.append(['  Dificuldade   ','<-    Medio   ->'])
telas.append(['  Dificuldade   ','<-   Dificil  ->'])

st_line = [tela[0] for tela in telas]
nd_line = [tela[1] for tela in telas]

df = pd.DataFrame({"st_line": st_line, "nd_line": nd_line})

def binary_format(s):
    ans = ''.join([format(ord(x), '08b') for x in s])
    ans += ''.join([format(0, '08b') for x in range(16 - len(s))])
    return ans


df['binary_1st'] = df['st_line'].apply(binary_format)
df['binary_2nd'] = df['nd_line'].apply(binary_format)

# 110 -> Registrador atualizado com a palavra e os undelines
st_setup = "\n----- 1st line SETUP -----"

for y in range(128):
  st_setup += f"\nwith sel select st_line({127-y}) <="
  for x in range(len(telas)+2):
    if(x==6):
      st_setup += f"\n\tword({127-y}) when \"{format(x, f'03b')}\","
    elif(x==7):
      st_setup += f"\n\tword({127-y}) when \"{format(x, f'03b')}\","
    else:
      st_setup += f"\n\t'{df['binary_1st'][x][y]}' when \"{format(x, f'03b')}\","

  st_setup += "\n\t'0' when others;\n"


nd_setup = "\n----- 2nd line SETUP -----"
for y in range(128):
  nd_setup += f"\nwith sel select nd_line({127-y}) <="
  for x in range(len(telas)+2):
    if(x==6):
      nd_setup += f"\n\tpalpite({y}) when \"{format(x, f'03b')}\"," if y<7 else f"\n\tpalpites_anteriores({127 - y}) when \"{format(x, f'03b')}\","
    elif(x==7):
      nd_setup += f"\n\ttip({127-y}) when \"{format(x, f'03b')}\","
    else:
      nd_setup += f"\n\t'{df['binary_2nd'][x][y]}' when \"{format(x, f'03b')}\","
  nd_setup += "\n\t'0' when others;\n"

divider = "\n-----------------------------------\n"
with open('telas.vhd', 'w') as f:
  f.write(divider + st_setup + divider + nd_setup + divider)

telas_vhd = ''
with open('telas.vhd', 'r') as f:
  telas_vhd = f.read()

def debug(index):
  # para pesquinar no vs code no modo regex
  #'([01])' when "0000000"
  regex = f"'([01])' when \"{format(index, '03b')}\""
  # Para buscar no arquivo criado a sequência gerada por uma escolha
  matches = re.findall(regex, telas_vhd)

  word = matches[:128]
  tip = matches[128:]
  print(df['binary_1st'][index])
  print("".join(word))
  print(df['binary_2nd'][index])
  print("".join(tip))

debug(0)
debug(1)
debug(2)
