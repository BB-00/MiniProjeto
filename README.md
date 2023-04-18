lsdig_mp_p5_93279_93271

Mini-Projeto no �mbito da U.C. de Laborat�rios de Inform�tica
Temporizador hor�rio com contagem temporal decrescente

Docente: Professora Regente Iouliia Skliarova

Autores: ----------------------------------------------------------------
Ant�nio Moreira  (93279) - MIECT, Turma P5  -> Realizou 50% do trabalho
Bernardo Barreto (93271) - MIECT, Turma P5  -> Realizou 50% do trabalho
-------------------------------------------------------------------------

Funcionamento: ----------------------------------------------------------

	O projeto utiliza o sinal CLOCK_50 da FPGA. Ou seja, um sinal de clock com 50MHz de frequ�ncia.
	No entanto, � necess�rio um sinal com 1Hz de frequ�ncia, pelo que � utilizado um divisor de frequ�ncia (freqDivN.vhd) com um fator de 500.000.

	Este sinal � ligado � entrada de clock do contador (Counter.vhd) , que vai decrementando o tempo restante.
	Nas Fases 1, 2 e 3 este bloco aceita,como inputs para al�m do clock, um sinal de reset e outro de start. Na Fase 4 passa tamb�m a aceitar um input na forma de um vetor com 13 bits correspondente ao tempo introduzido pelo utilizador (ss:cc) em bin�rio e devolve um sinal an�logo (13 bits em bin�rio) que corresponde ao tempo restante depois de ter sido, dependendo do estado do start, decrementado por 1 segundo.
	Para al�m disso, se o temporizador chegar a 00.00 ativa a sa�da ledOut.
	O contador possui um enable que corresponde ao estado da pausa do temporizador e um reset ass�ncrono.
	
	A sa�da do contador � depois encaminhada para um conversor de bin�rio para BCD (Bin2BCD.vhd) onde � dividida em sinais de 4 bits que s�o ligados a Decoders de BCD para valores em bin�rio utiliz�veis por um display de 7 segmentos (Bin7SegDecoder.vhd). Neste caso, a sa�da destes decoders � finalmente encaminhada para os displays de 7 segmentos.

	Na FASE 4 � ainda utilizado o bloco Register_Freeze (Register_Freeze.vhd) para que se possa dar freeze no tempo que est� nos mostradores, mas continuando a contagem.

Utiliza��o: -------------------------------------------------------------
	
	O temporizador come�a automaticamente em 59 segundos e 99 centesimas (59.99).
	Para fazer start/stop, clicar em KEY1 (dependedo da fase em quest�o).
	Para fazer pause/reset, clicar em KEY0 (dependedo da fase em quest�o).

	A LEDG8 ir� acender quando o temporizador acabar.


	***** FASE 1 *****
	
	Para iniciar a contagem � necess�rio ativar o start (KEY1).
	O reset reverte o valor do temporizador para 59s99 e pode ser ativado a qualquer altura (KEY0).
	Nesta fase, ainda n�o existe a funcionalidade do stop.
	
	O valor da contagem pode ser observado nos Displays de 7 segmentos do HEX3 ao HEX0.
	Os valores encontram-se em Decimal.

	HEX3 -> Dezenas de Segundos
	HEX2 -> Unidades de Segundos
	HEX1 -> Dezenas de Cent�simos
	HEX0 -> Unidades de Cent�simos

	Quando o temporizador acabar, o LEDG8 ir� ligar.


	***** FASE 2 *****
	
	Para iniciar a contagem � necess�rio ativar o start (KEY1).
	O reset reverte o valor do temporizador para 59s99 e pode ser ativado a qualquer altura (KEY0).
	Para interromper ou recome�ar a contagem ativar o start/stop (KEY1).
	
	O valor da contagem pode ser observado nos Displays de 7 segmentos (HEX) do HEX3 ao HEX0.
	Os valores encontram-se em Decimal.

	HEX3 -> Dezenas de Segundos
	HEX2 -> Unidades de Segundos
	HEX1 -> Dezenas de Cent�simos
	HEX0 -> Unidades de Cent�simos

	Quando o temporizador acabar, o LEDG8 ir� ligar.


	***** FASE 3 *****

	Para iniciar a contagem � necess�rio ativar o start (KEY1).
	O reset reverte o valor do temporizador para 59s99, mas apenas pode ser ativado (KEY0) quando a contagem estiver parada.
	Para fazer freeze do mostrador naquele instante, ativar o pause/reset (KEY0), apenas funciona quando a contagem est� a acontecer.
	Para interromper ou recome�ar a contagem ativar o start/stop (KEY1).

	O valor da contagem pode ser observado pelos Displays de 7 segmentos (HEX) do HEX3 ao HEX0.
	Os valores encontram-se em Decimal.

	HEX3 -> Dezenas de Segundos
	HEX2 -> Unidades de Segundos
	HEX1 -> Dezenas de Cent�simos
	HEX0 -> Unidades de Cent�simos

	Quando o temporizador acabar, o LEDG8 ir� ligar.


	***** FASE 4 *****

	Para iniciar a contagem � necess�rio ativar o start (KEY1).
	Para fazer reset (KEY0), � necess�rio que a contagem esteja parada e o valor do load seja 0 (em bin�rio "0000000000000", ou seja, os switches (SW) de 12 a 0 t�m de estar a '0').
	Para fazer freeze do mostrador naquele instante, ativar o pause/reset (KEY0), apenas funciona quando a contagem est� a acontecer.
	Para interromper ou recome�ar a contagem ativar o start/stop (KEY1).
	Para fazer load do valor pretendido � necess�rio que a contagem esteja parada e que o o dysplay esteja em freeze.
	
	--- LOAD ---
	Representar o valor pretendido em bin�rio usando os swictes (SW) de SW12 a SW0. 
	Ap�s concluir o posicionamento correto dos switches, ativar o reset, desta forma o valor � carregado para o contador e � mostrado nos Displays de 7 segmentos.
	Para recome�ar o temporizador clica-se de novo em KEY1.
	------
	
	O valor da contagem pode ser observado pelos Displays de 7 segmentos (HEX) do HEX3 ao HEX0.
	Os valores encontram-se em Decimal.

	HEX3 -> Dezenas de Segundos
	HEX2 -> Unidades de Segundos
	HEX1 -> Dezenas de Cent�simos
	HEX0 -> Unidades de Cent�simos

	Quando o temporizador acabar, o LEDG8 ir� ligar.