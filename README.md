lsdig_mp_p5_93279_93271

Mini-Projeto no âmbito da U.C. de Laboratórios de Informática
Temporizador horário com contagem temporal decrescente

Docente: Professora Regente Iouliia Skliarova

Autores: ----------------------------------------------------------------
António Moreira  (93279) - MIECT, Turma P5  -> Realizou 50% do trabalho
Bernardo Barreto (93271) - MIECT, Turma P5  -> Realizou 50% do trabalho
-------------------------------------------------------------------------

Funcionamento: ----------------------------------------------------------

	O projeto utiliza o sinal CLOCK_50 da FPGA. Ou seja, um sinal de clock com 50MHz de frequência.
	No entanto, é necessário um sinal com 1Hz de frequência, pelo que é utilizado um divisor de frequência (freqDivN.vhd) com um fator de 500.000.

	Este sinal é ligado à entrada de clock do contador (Counter.vhd) , que vai decrementando o tempo restante.
	Nas Fases 1, 2 e 3 este bloco aceita,como inputs para além do clock, um sinal de reset e outro de start. Na Fase 4 passa também a aceitar um input na forma de um vetor com 13 bits correspondente ao tempo introduzido pelo utilizador (ss:cc) em binário e devolve um sinal análogo (13 bits em binário) que corresponde ao tempo restante depois de ter sido, dependendo do estado do start, decrementado por 1 segundo.
	Para além disso, se o temporizador chegar a 00.00 ativa a saída ledOut.
	O contador possui um enable que corresponde ao estado da pausa do temporizador e um reset assíncrono.
	
	A saída do contador é depois encaminhada para um conversor de binário para BCD (Bin2BCD.vhd) onde é dividida em sinais de 4 bits que são ligados a Decoders de BCD para valores em binário utilizáveis por um display de 7 segmentos (Bin7SegDecoder.vhd). Neste caso, a saída destes decoders é finalmente encaminhada para os displays de 7 segmentos.

	Na FASE 4 é ainda utilizado o bloco Register_Freeze (Register_Freeze.vhd) para que se possa dar freeze no tempo que está nos mostradores, mas continuando a contagem.

Utilização: -------------------------------------------------------------
	
	O temporizador começa automaticamente em 59 segundos e 99 centesimas (59.99).
	Para fazer start/stop, clicar em KEY1 (dependedo da fase em questão).
	Para fazer pause/reset, clicar em KEY0 (dependedo da fase em questão).

	A LEDG8 irá acender quando o temporizador acabar.


	***** FASE 1 *****
	
	Para iniciar a contagem é necessário ativar o start (KEY1).
	O reset reverte o valor do temporizador para 59s99 e pode ser ativado a qualquer altura (KEY0).
	Nesta fase, ainda não existe a funcionalidade do stop.
	
	O valor da contagem pode ser observado nos Displays de 7 segmentos do HEX3 ao HEX0.
	Os valores encontram-se em Decimal.

	HEX3 -> Dezenas de Segundos
	HEX2 -> Unidades de Segundos
	HEX1 -> Dezenas de Centésimos
	HEX0 -> Unidades de Centésimos

	Quando o temporizador acabar, o LEDG8 irá ligar.


	***** FASE 2 *****
	
	Para iniciar a contagem é necessário ativar o start (KEY1).
	O reset reverte o valor do temporizador para 59s99 e pode ser ativado a qualquer altura (KEY0).
	Para interromper ou recomeçar a contagem ativar o start/stop (KEY1).
	
	O valor da contagem pode ser observado nos Displays de 7 segmentos (HEX) do HEX3 ao HEX0.
	Os valores encontram-se em Decimal.

	HEX3 -> Dezenas de Segundos
	HEX2 -> Unidades de Segundos
	HEX1 -> Dezenas de Centésimos
	HEX0 -> Unidades de Centésimos

	Quando o temporizador acabar, o LEDG8 irá ligar.


	***** FASE 3 *****

	Para iniciar a contagem é necessário ativar o start (KEY1).
	O reset reverte o valor do temporizador para 59s99, mas apenas pode ser ativado (KEY0) quando a contagem estiver parada.
	Para fazer freeze do mostrador naquele instante, ativar o pause/reset (KEY0), apenas funciona quando a contagem está a acontecer.
	Para interromper ou recomeçar a contagem ativar o start/stop (KEY1).

	O valor da contagem pode ser observado pelos Displays de 7 segmentos (HEX) do HEX3 ao HEX0.
	Os valores encontram-se em Decimal.

	HEX3 -> Dezenas de Segundos
	HEX2 -> Unidades de Segundos
	HEX1 -> Dezenas de Centésimos
	HEX0 -> Unidades de Centésimos

	Quando o temporizador acabar, o LEDG8 irá ligar.


	***** FASE 4 *****

	Para iniciar a contagem é necessário ativar o start (KEY1).
	Para fazer reset (KEY0), é necessário que a contagem esteja parada e o valor do load seja 0 (em binário "0000000000000", ou seja, os switches (SW) de 12 a 0 têm de estar a '0').
	Para fazer freeze do mostrador naquele instante, ativar o pause/reset (KEY0), apenas funciona quando a contagem está a acontecer.
	Para interromper ou recomeçar a contagem ativar o start/stop (KEY1).
	Para fazer load do valor pretendido é necessário que a contagem esteja parada e que o o dysplay esteja em freeze.
	
	--- LOAD ---
	Representar o valor pretendido em binário usando os swictes (SW) de SW12 a SW0. 
	Após concluir o posicionamento correto dos switches, ativar o reset, desta forma o valor é carregado para o contador e é mostrado nos Displays de 7 segmentos.
	Para recomeçar o temporizador clica-se de novo em KEY1.
	------
	
	O valor da contagem pode ser observado pelos Displays de 7 segmentos (HEX) do HEX3 ao HEX0.
	Os valores encontram-se em Decimal.

	HEX3 -> Dezenas de Segundos
	HEX2 -> Unidades de Segundos
	HEX1 -> Dezenas de Centésimos
	HEX0 -> Unidades de Centésimos

	Quando o temporizador acabar, o LEDG8 irá ligar.