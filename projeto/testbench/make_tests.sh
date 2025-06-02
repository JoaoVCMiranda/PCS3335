#!/bin/bash
#
# Script para automatizar a simulação GHDL de entidades VHDL.
#
# Uso: ./simulate_ghdl.sh <arquivo_com_caminhos_vhdl> <nome_da_entidade_testbench> [nome_do_arquivo_vcd]
#
# Argumentos:
#   <arquivo_com_caminhos_vhdl>: Um arquivo de texto contendo os caminhos completos
#                                para todos os arquivos VHDL (componentes e testbench),
#                                um por linha.
#   <nome_da_entidade_testbench>: O nome da entidade VHDL que é o seu testbench
#                                (ex: banco_palavras_tb). Esta será a entidade
#                                elaborada e executada.
#   [nome_do_arquivo_vcd]: (Opcional) O nome do arquivo VCD a ser gerado.
#                          Padrão: waveform.vcd
#
# O script irá:
# 1. Verificar a presença do GHDL.
# 2. Ler os caminhos dos arquivos VHDL do arquivo de entrada.
# 3. Analisar cada arquivo VHDL.
# 4. Elaborar a entidade do testbench especificada.
# 5. Executar a simulação do testbench e gerar um arquivo VCD.
# 6. Fornecer feedback detalhado sobre cada etapa.

# --- Configurações Iniciais ---
# Saia imediatamente se um comando falhar
set -e
# Trate variáveis não definidas como erro
set -u
# O valor de retorno de um pipeline é o status do último comando a sair com um status diferente de zero
set -o pipefail

# Habilita o rastreamento de comandos (útil para depuração, comente para menos verbosidade)
# set -x

# Cores para saída no terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # Sem cor

# --- Funções Auxiliares ---

# Função para exibir mensagens de erro e sair
error_exit() {
    echo -e "${RED}ERRO: $1${NC}" >&2
    exit 1
}

# Função para verificar se o GHDL está instalado
check_ghdl() {
    echo -e "${YELLOW}Verificando a instalação do GHDL...${NC}"
    if ! command -v ghdl &> /dev/null; then
        error_exit "GHDL não encontrado. Por favor, instale o GHDL e certifique-se de que esteja no seu PATH."
    fi
    echo -e "${GREEN}GHDL encontrado.${NC}"
}

# Função para analisar um arquivo VHDL
analyse_vhdl_file() {
    local file="$1"
    echo -e "${YELLOW}Analisando: ${file}${NC}"
    ghdl -a "$file" || error_exit "Falha na análise de ${file}"
    echo -e "${GREEN}Análise de ${file} concluída com sucesso.${NC}"
}

# Função para elaborar a entidade do testbench
elaborate_testbench() {
    local testbench_entity="$1"
    echo -e "${YELLOW}Elaborando testbench: ${testbench_entity}${NC}"
    ghdl -e "$testbench_entity" || error_exit "Falha na elaboração do testbench ${testbench_entity}"
    echo -e "${GREEN}Elaboração do testbench ${testbench_entity} concluída com sucesso.${NC}"
}

# Função para executar a simulação e gerar o VCD
run_simulation() {
    local testbench_entity="$1"
    local vcd_file="$2"
    echo -e "${YELLOW}Executando simulação para ${testbench_entity} e gerando VCD: ${vcd_file}${NC}"
    ghdl -r "$testbench_entity" --vcd="$vcd_file" || error_exit "Falha na execução da simulação para ${testbench_entity}"
    echo -e "${GREEN}Simulação concluída. Arquivo VCD gerado em: ${vcd_file}${NC}"
}

# --- Lógica Principal do Script ---

# 1. Verificação de Argumentos
if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
    echo "Uso: $0 <arquivo_com_caminhos_vhdl> <nome_da_entidade_testbench> [nome_do_arquivo_vcd]"
    echo "Exemplo: $0 my_vhdl_files.txt my_component_tb output.vcd"
    exit 1
fi

VHDL_PATHS_FILE="$1"
TESTBENCH_ENTITY="$2"
VCD_OUTPUT_FILE="${3:-waveform.vcd}" # Usa o terceiro argumento ou 'waveform.vcd' como padrão

echo -e "${GREEN}--- Início do Processo de Simulação GHDL ---${NC}"
echo "Arquivo de caminhos VHDL: ${VHDL_PATHS_FILE}"
echo "Entidade Testbench: ${TESTBENCH_ENTITY}"
echo "Arquivo VCD de Saída: ${VCD_OUTPUT_FILE}"
echo "---------------------------------------------"

# 2. Verificar a existência do arquivo de caminhos VHDL
if [ ! -f "$VHDL_PATHS_FILE" ]; then
    error_exit "O arquivo de caminhos VHDL '${VHDL_PATHS_FILE}' não foi encontrado."
fi

# 3. Verificar a instalação do GHDL
check_ghdl

# 4. Analisar todos os arquivos VHDL listados
echo -e "${YELLOW}Iniciando a fase de Análise...${NC}"
while IFS= read -r vhdl_file_path; do
    if [ -n "$vhdl_file_path" ]; then # Garante que a linha não está vazia
        # Verifica se o arquivo VHDL existe antes de tentar analisar
        if [ ! -f "$vhdl_file_path" ]; then
            error_exit "Arquivo VHDL não encontrado: '${vhdl_file_path}'. Verifique o arquivo de caminhos."
        fi
        analyse_vhdl_file "$vhdl_file_path"
    fi
done < "$VHDL_PATHS_FILE"
echo -e "${GREEN}Todos os arquivos VHDL analisados com sucesso.${NC}"

# 5. Elaborar o testbench
elaborate_testbench "$TESTBENCH_ENTITY"

# 6. Executar a simulação e gerar o arquivo VCD
run_simulation "$TESTBENCH_ENTITY" "$VCD_OUTPUT_FILE"

echo -e "${GREEN}--- Simulação GHDL concluída com sucesso! ---${NC}"
echo -e "${GREEN}Você pode visualizar as formas de onda usando um visualizador VCD (ex: GTKWave):${NC}"
echo -e "${GREEN}gtkwave ${VCD_OUTPUT_FILE}${NC}"
echo "---------------------------------------------"

exit 0