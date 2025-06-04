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

echo -e "${AZUL}--- Iniciando o sistema de compilação GHDL ---${RESET}"

# --- FASE 1: Compilar todos os arquivos .vhd na primeira execução ---
echo -e "${AMARELO}FASE 1: Realizando uma compilação inicial de TODOS os arquivos .vhd...${RESET}"
echo -e "${AMARELO}Isso garante que o projeto esteja em um estado consistente antes de iniciar o monitoramento.${RESET}"

./hdlç_full.sh

echo -e "${VERDE}FASE 1: Compilação inicial de todos os arquivos concluída com sucesso!${RESET}"
echo ""

# --- FASE 2: Iniciar monitoramento de arquivos com entr ---
echo -e "${AZUL}FASE 2: Iniciando monitoramento de arquivos VHDL para recompilação automática...${RESET}"
echo -e "${AMARELO}Qualquer alteração em arquivos .vhd nas subpastas irá disparar a compilação APENAS do arquivo modificado.${RESET}"
echo -e "${BRANCO}Pressione Ctrl+C a qualquer momento para parar o monitoramento.${RESET}"
echo ""

# Encontra todos os arquivos .vhd recursivamente e passa para o entr
# O 'entr' executa o comando para cada arquivo modificado.
# A opção '-p' faz o entr passar o caminho completo do arquivo modificado para o stdin do comando.
# O 'xargs -I {}' lê o caminho do arquivo do stdin e o passa como argumento para o script de compilação.
find . -type f -name "*.vhd" | entr -p sh -c './hdlç.sh "$0"'
