# PCS3335 - Laboratório Digital A

Esse é o nosso projeto final da matéria PCS3335
É um jogo da forca feito em VHDL que envia dados para uma raspberry pi e os mostra em um display LCD 16x2

## Manual de Uso

Conforme descrito no apêndice do relatório, os passos para jogar são:

1.  **Carregar e Iniciar:** Carregue os arquivos no Quartus, compile e programe a placa FPGA. Pressione o botão **start (botão 3)** para avançar da tela inicial.
2.  **Selecionar Dificuldade:** Na tela de seleção, use as chaves **SW9 e SW8** para escolher a dificuldade:
    *   `01`: Fácil
    *   `10`: Médio
    *   `11`: Politécnico (Difícil)
    Pressione o botão **select** para confirmar.
3.  **Jogar:**
    *   A palavra a ser descoberta aparecerá como uma série de underlines (`_`) na tela, junto com uma dica.
    *   Para fazer um palpite, ative a **chave de palpite (SW6)**. Isso muda a exibição da dica para a letra do palpite atual.
    *   Use os botões de **esquerda (botão 1)** e **direita (botão 0)** para navegar pelo alfabeto.
    *   Pressione **select** para confirmar a letra escolhida como palpite.
4.  **Pontuação e Vidas:**
    *   Você começa com 6 vidas.
    *   Cada palpite correto revela a letra na palavra e concede pontos. Acertos em sequência aumentam um multiplicador de **combo**.
    *   Cada palpite incorreto custa uma vida e reinicia o combo para 1.
    *   O jogo termina quando você descobre a palavra inteira (vitória) ou perde todas as suas vidas (derrota).
5.  **Objetivo:** Descobrir a palavra escondida e alcançar a maior pontuação possível.

## Demonstração

Imagens do jogo em funcionamento.

**Antes do primeiro palpite:**
fig/8.png

**Após o primeiro palpite ("A"):**
fig/9.png

**Após o segundo palpite ("D"):**
fig/10.png

**Após o terceiro palpite ("E"):**
fig/11.png

**Tela de Dica:**
fig/12.png

**Tela de Vitória:**
fig/13.png

## RTL

Visão geral e diagramas de blocos do sistema.

**Visão geral do RTL:**
fig/3.png

**Blocos do PLL, Detectores de Borda, FSM e Ajuste de Tela Inicial:**
fig/4.png

**Blocos do Seletor de Palavras, Registradores, Detectores e Comparador:**
fig/5.png

**16 `letter_register` para armazenar as letras da palavra:**
fig/6.png

**Blocos de registradores de palavra e tela, MUX, Transmissor e Vidas:**
fig/7.png

## Port Map (Entidade Principal: forca.vhd)

Esta é a entidade de nível superior que integra todos os módulos.

*   `clock_pre_pll`, `reset`: Entradas de clock e reset globais.
*   `start_bt`, `select_bt`, `left_bt`, `right_bt`, `guess_on_key`: Entradas de botões para controle do jogo (iniciar, selecionar, mover cursor, adivinhar letra).
*   `difficulty_keys (1 downto 0)`: Entrada para definir a dificuldade do jogo (e.g., "01" para Fácil, "10" para Médio, "11" para Difícil).
*   `lifes_out (5 downto 0)`: Saída que indica o número de vidas restantes.
*   `serial_out`: Saída serial para comunicação com o dispositivo de exibição (e.g., LCD).
*   `state_seg (6 downto 0)`: Saída para exibição de estado em um display de 7 segmentos.

## Componentes

### Banco de Palavras

Corresponde ao módulo `word_selector.vhd`. É responsável por selecionar a palavra a ser adivinhada com base na dificuldade escolhida pelo jogador.

*   **Entrada:** `data_in (1 downto 0)` - Recebe o nível de dificuldade.
*   **Saída:** `data_out (255 downto 0)` - Fornece a palavra selecionada para o jogo.

### Comparador

Corresponde ao módulo `comparator.vhd`. Este componente é central para a lógica do jogo, comparando a letra palpitada pelo usuário com a palavra oculta e gerenciando os acertos e erros.

*   **Entradas:**
    *   `guess (7 downto 0)`: A letra do palpite do usuário.
    *   `data_in (127 downto 0)`: A palavra oculta.
*   **Saídas:**
    *   `bad_guess`: Sinaliza que o palpite foi errado.
    *   `victory_detector`: Sinaliza que todas as letras foram descobertas (vitória).
    *   `successful_comparisons (15 downto 0)`: Vetor que indica as posições onde o palpite coincidiu com uma letra da palavra.

### Sistema de Pontuação

Corresponde ao módulo `Pontuacao.vhd`. Ele calcula a pontuação do jogador.

*   Utiliza o sinal `sucessful_comparisons` para determinar quantos acertos ocorreram em uma rodada.
*   Adiciona pontos ao total e incrementa um combo para acertos consecutivos.
*   O combo é reiniciado para 1 quando o jogador erra um palpite (`lose_a_life`).
*   **Saídas:** `combo`, `total` - Fornecem o valor do combo e a pontuação total.

### Transmissor Serial

Composto pelos módulos `transmitter.vhd` e `transmitter_mux.vhd`. É responsável por converter os dados paralelos do jogo (mensagens, palavra, etc.) em um fluxo de dados serial para ser enviado ao display LCD via Raspberry Pi.

*   O `transmitter_mux` seleciona qual dado deve ser enviado (tela inicial, palavra com underlines, mensagem de vitória/derrota) com base no estado atual do jogo.
*   O `transmitter` pega o dado paralelo selecionado e o converte para serial, controlando o start bit, data bits e stop bit a uma baud rate de 9600 bps.

### Máquina de Estados Principal

Implementada no módulo `fsm.vhd`, esta FSM controla todo o fluxo do jogo, desde o início, seleção de dificuldade, palpites, até as telas de vitória ou derrota.

**Diagrama de Estados:**
fig/1.png

**Legenda dos Estados:**
*   `q0`: Tela de início.
*   `q1`: Tela de seleção de dificuldade.
*   `q2`: Prepara a exibição inicial da palavra com underlines (`_`).
*   `q3`: Transmite os underlines para o display.
*   `q4`: Carrega a palavra secreta internamente.
*   `q5`: Prepara o sistema para receber um palpite.
*   `q6`: Comparador verifica se todas as letras já foram descobertas.
*   `q7`: Estado de espera pelo palpite do jogador.
*   `q8`: Comparador verifica o palpite. Ativa `bad_guess` se o palpite estiver errado.
*   `q9`: Palpite correto. Atualiza o transmissor e o sistema de pontuação.
*   `q10`: Analisa o detector de vitória.
*   `q11`: Palpite errado. A entidade de vidas é acionada para decrementar uma vida.
*   `q12`: Verifica o detector de derrota.
*   `q13`: Estado de vitória. Exibe a mensagem "VOCÊ VENCEU".
*   `q14`: Estado de derrota. Exibe a mensagem "FIM DE JOGO".

### Seletor aleatório

A proposta inicial incluía um algoritmo pseudoaleatório para a escolha de palavras. No entanto, conforme o relatório: "dada a dificuldade no desenvolvimento do projeto, optamos por refazer parte das entidades, e isso envolveu a substituição da entidade desse algoritmo para outra mais simples e de construção diferente."

A função foi substituída pelo componente `word_selector.vhd` (descrito em "Banco de Palavras"), que seleciona uma palavra de forma determinística com base no nível de dificuldade escolhido.

## Adicionais

### Python

Para inserir novas palavras
