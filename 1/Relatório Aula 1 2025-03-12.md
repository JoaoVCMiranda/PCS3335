#PCS3335

# Resumo

Na aula de hoje de PCS335 revisamos alguns conceitos básicos de VHDL, bem como a introdução às placas FPGA da Intel no Quartus Prime(hoje trabalhamos com a `5CEBA4F23C7N`) 

## Projeto

Inicialmente, aprendemos a fazer a conversão de binários de 4 bits para representação decimal nos displays embutidos.

Em seguida fizemos o instanciamento dos componentes utilizados para cobrir utilizar todos os "displays"

Porém, como não utilizaremos todas as combinações possíveis do display com apenas 10 bits, faremos um palíndromo, espelhando os as entradas nos componentes 
$(d_1, d_6)$,$(d_2,d_5)$,$(d_3,d_4)$

E concatenamos o último bit_vector com dois zeros nos algarismos mais significativos.

### Diagrama RTL
Nossa entidade recebe todos os bits de entrada(10) e retorna todos os bits de saída(7x6=42)

![](media/rtl.png)
### FPGA
A placa já contêm 6x displays de 7 bits embutidos, assim como 10 bits de entrada(que utilizamos para escolher os números), além do mapeamento de portas de acordo com as especificações da placa

![](media/fpga.pdf)

Finalmente, compilamos e enviamos o código a placa para visualizar o palíndromo.

#### Alunos
João Victor Miranda - 14582927
João Vitor Adami - 14583077
