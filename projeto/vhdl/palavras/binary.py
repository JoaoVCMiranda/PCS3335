#lvl1[0].apply(lambda s: ' '.join(format(ord(x), '08b') for x in s))
#bin_lvl1[['binary_char_norm', 'binary_char_tip_norm', 'binary_word','binary_tip']].to_csv('palavras/lvl1.dat', sep=" ", encoding='utf-8',index=False, header=False)
import pandas as pd
import re

lvl1 = ''

with open('lvl1.txt','r') as f:
	lvl1 = pd.read_csv(f, header=None)

def binary_format(s):
  ans  = ''.join([format(0, '08b') for x in range(16 - len(s))])
  ans += ''.join([format(ord(x), '08b') for x in s])
  return ans


lvl1['binary_word'] = lvl1[0].apply(binary_format)
lvl1['binary_tip'] = lvl1[1].apply(binary_format)

word_setup = "\n----- WORD SETUP -----"
# Numero de bits 16*8
for y in range(128):
  word_setup += f"\nwith binary_select select binary_word({127-y}) <="
  for x in range(len(lvl1)):
    word_setup += f"\n\t'{lvl1['binary_word'][x][y]}' when \"{format(x, f'07b')}\","
  word_setup += "\n\t'0' when others;\n"

tip_setup = "\n----- TIP SETUP -----"
for y in range(128):
  tip_setup += f"\nwith binary_select select binary_tip({127-y}) <="
  for x in range(len(lvl1)):
    tip_setup += f"\n\t'{lvl1['binary_tip'][x][y]}' when \"{format(x, f'07b')}\","
  tip_setup += "\n\t'0' when others;\n"

divider = "\n-----------------------------------\n"
with open('lvl1.vhd', 'w') as f:
  f.write(divider + word_setup + divider + tip_setup + divider)


lvl1_vhd = ''
with open('lvl1.vhd', 'r') as f:
  lvl1_vhd = f.read()

def debug1_by_index(index):
  # para pesquinar no vs code no modo regex
  #'([01])' when "0000000"
  regex = f"'([01])' when \"{format(index, '07b')}\""
  # Para buscar no arquivo criado a sequência gerada por uma escolha
  matches = re.findall(regex, lvl1_vhd)

  word = matches[:128]
  tip = matches[128:]
  print(lvl1['binary_word'][index])
  print("".join(word))
  print(lvl1['binary_tip'][index])
  print("".join(tip))

lvl2 = ''

with open('lvl2.txt','r') as f:
	lvl2 = pd.read_csv(f, header=None)

lvl2['binary_word'] = lvl2[0].apply(binary_format)
lvl2['binary_tip'] = lvl2[1].apply(binary_format)

word_setup = "\n----- WORD SETUP -----"
# Numero de bits 16*8
for y in range(128):
  word_setup += f"\nwith binary_select select binary_word({127-y}) <= "
  for x in range(len(lvl2)):
    word_setup += f"\n\t'{lvl2['binary_word'][x][y]}' when \"{format(x, f'07b')}\","
  word_setup += "\n\t'0' when others;\n"

tip_setup = "\n----- TIP SETUP -----"
for y in range(128):
  tip_setup += f"\nwith binary_select select binary_tip({127-y}) <= "
  for x in range(len(lvl2)):
    tip_setup += f"\n\t'{lvl2['binary_tip'][x][y]}' when \"{format(x, f'07b')}\","
  tip_setup += "\n\t'0' when others;\n"

divider = "\n-----------------------------------\n"
with open('lvl2.vhd', 'w') as f:
  f.write(divider + word_setup + divider + tip_setup + divider)


lvl2_vhd = ''
with open('lvl2.vhd', 'r') as f:
  lvl2_vhd = f.read()

def debug2_by_index(index):
  # para pesquinar no vs code no modo regex
  #'([01])' when "0000000"
  regex = f"'([01])' when \"{format(index, '07b')}\""
  # Para buscar no arquivo criado a sequência gerada por uma escolha
  matches = re.findall(regex, lvl2_vhd)

  word = matches[:128]
  tip = matches[128:]
  print(lvl2['binary_word'][index])
  print("".join(word))
  print(lvl2['binary_tip'][index])
  print("".join(tip))

lvl3 = ''

with open('lvl3.txt','r') as f:
	lvl3 = pd.read_csv(f, header=None)

lvl3['binary_word'] = lvl3[0].apply(binary_format)
lvl3['binary_tip'] = lvl3[1].apply(binary_format)

word_setup = "\n----- WORD SETUP -----"
# Numero de bits 16*8
for y in range(128):
  word_setup += f"\nwith binary_select select binary_word({127-y}) <="
  for x in range(len(lvl3)):
    word_setup += f"\n\t'{lvl3['binary_word'][x][y]}' when \"{format(x, f'06b')}\","
  word_setup += "\n\t'0' when others;\n"

tip_setup = "\n----- TIP SETUP -----"
for y in range(128):
  tip_setup += f"\nwith binary_select select binary_tip({127-y}) <="
  for x in range(len(lvl3)):
    tip_setup += f"\n\t'{lvl3['binary_tip'][x][y]}' when \"{format(x, f'06b')}\","
  tip_setup += "\n\t'0' when others;\n"

divider = "\n-----------------------------------\n"
with open('lvl3.vhd', 'w') as f:
  f.write(divider + word_setup + divider + tip_setup + divider)


lvl3_vhd = ''
with open('lvl3.vhd', 'r') as f:
  lvl3_vhd = f.read()

def debug3_by_index(index):
  # para pesquinar no vs code no modo regex
  #'([01])' when "0000000"
  regex = f"'([01])' when \"{format(index, '06b')}\""
  # Para buscar no arquivo criado a sequência gerada por uma escolha
  matches = re.findall(regex, lvl3_vhd)

  word = matches[:128]
  tip = matches[128:]
  print(lvl3['binary_word'][index])
  print("".join(word))
  print(lvl3['binary_tip'][index])
  print("".join(tip))


debug1_by_index(1)
debug2_by_index(2)
debug3_by_index(3)