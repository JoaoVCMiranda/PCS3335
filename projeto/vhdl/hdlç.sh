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

# Verifica se um arquivo foi passado como argumento
if [ -z "$1" ]; then
  echo -e "${VERMELHO}ERRO: Nenhum arquivo .vhd especificado para compilação.${RESET}"
  echo -e "${AMARELO}Este script deve ser chamado com o caminho de um arquivo .vhd como argumento (ex: ./compilar_vhdl.sh meu_modulo.vhd).${RESET}"
  exit 1
fi

# O arquivo a ser processado é o primeiro argumento ($1)
arquivo="$1"

# Verifica se o arquivo existe e tem a extensão .vhd
if [ ! -f "$arquivo" ]; then
  echo -e "${VERMELHO}ERRO: Arquivo '${arquivo}' não encontrado ou não é um arquivo regular.${RESET}"
  exit 1
elif [[ ! "$arquivo" =~ \.vhd$ ]]; then
  echo -e "${VERMELHO}ERRO: Arquivo '${arquivo}' não termina com a extensão .vhd.${RESET}"
  exit 1
fi

echo -e "${AZUL}--- Iniciando compilação GHDL para arquivo modificado ---${RESET}"
echo -e "${CIANO}Processando arquivo: ${arquivo}${RESET}"

# Comando ghdl -s (sintetizar)
echo -e "${ROXO}Executando: ghdl -s ${arquivo}${RESET}"
if ghdl -s "$arquivo"; then
  echo -e "${VERDE}Sintetização de ${arquivo} concluída com sucesso!${RESET}"
else
  echo -e "${VERMELHO}ERRO CRÍTICO: Falha na sintetização de ${arquivo}.${RESET}"
  echo -e "${VERMELHO}Por favor, corrija o erro antes de continuar.${RESET}"
  exit 1 # Encerra o script com código de erro
fi

echo "" # Linha em branco para melhor leitura

# Comando ghdl -a (analisar)
echo -e "${ROXO}Executando: ghdl -a ${arquivo}${RESET}"
if ghdl -a "$arquivo"; then
  echo -e "${VERDE}Análise de ${arquivo} concluída com sucesso!${RESET}"
else
  echo -e "${VERMELHO}ERRO CRÍTICO: Falha na análise de ${arquivo}.${RESET}"
  echo -e "${VERMELHO}Por favor, corrija o erro antes de continuar.${RESET}"
  exit 1 # Encerra o script com código de erro
fi

echo -e "${AZUL}--- Compilação GHDL de '${arquivo}' concluída ---${RESET}"
