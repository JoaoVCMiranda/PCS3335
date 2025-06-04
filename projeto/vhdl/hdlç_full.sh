#!/bin/bash

# Cores para as mensagens de depuração
VERMELHO='\033[0;31m'
VERDE='\033[0;32m'
AMARELO='\033[0;33m'
AZUL='\033[0;34m'
ROXO='\033[0;35m'
CIANO='\033[0;36m'
BRANCO='\033[1;37m'
RESET='\033[0m' # Reseta a cor para o padrão

echo -e "${AZUL}--- Iniciando a compilação GHDL ---${RESET}"
echo -e "${AMARELO}Procurando arquivos .vhd recursivamente a partir de: $(pwd)${RESET}"

# Encontra todos os arquivos .vhd recursivamente
# O comando 'find' localiza os arquivos.
# O comando 'while read -r arquivo' lê cada linha (caminho do arquivo) que o 'find' retorna.
find . -type f -name "*.vhd" | while read -r arquivo; do
  echo -e "${BRANCO}----------------------------------------------------${RESET}"
  echo -e "${CIANO}Processando arquivo: ${arquivo}${RESET}"

  # Comando ghdl -s (sintetizar)
  echo -e "${ROXO}Executando: ghdl -s ${arquivo}${RESET}"
  if ghdl -s "$arquivo"; then
    echo -e "${VERDE}Sintetização de ${arquivo} concluída com sucesso!${RESET}"
  else
    echo -e "${VERMELHO}Erro na sintetização de ${arquivo}. Verifique o código VHDL.${RESET}"
    # Se houver erro, podemos optar por parar o script ou continuar.
    # exit 1 # Descomente esta linha para parar o script em caso de erro
  fi

  echo "" # Linha em branco para melhor leitura

  # Comando ghdl -a (analisar)
  echo -e "${ROXO}Executando: ghdl -a ${arquivo}${RESET}"
  if ghdl -a "$arquivo"; then
    echo -e "${VERDE}Análise de ${arquivo} concluída com sucesso!${RESET}"
  else
    echo -e "${VERMELHO}Erro na análise de ${arquivo}. Verifique o código VHDL.${RESET}"
    # exit 1 # Descomente esta linha para parar o script em caso de erro
  fi
  echo -e "${BRANCO}----------------------------------------------------${RESET}"
  echo "" # Linha em branco para melhor leitura
done

echo -e "${AZUL}--- Compilação GHDL concluída ---${RESET}"
