--DUAL é uma tabela vazia - Data
SELECT * FROM DUAL;

SELECT SYSDATE FROM DUAL;

SELECT Round(45.925,2), --45,93
       Trunc(45.929,2), --45.92
       Mod(10, 2) AS RESTO_DIVISÃO,
       Trunc(1.99),
       Trunc(1.99, 2)
FROM DUAL;

--Funções de Data/Hora
SELECT DATA, SYSDATE, DATA + 5 FROM TCONTRATO;
SELECT SYSDATE - DATA AS DIF_DIAS FROM TCONTRATO;
SELECT Trunc(SYSDATE - DATA) AS DIAS FROM TCONTRATO;

--Somando horas em uma tabela
SELECT SYSDATE, SYSDATE + 2 / 24 AS ADD_HORAS FROM TCONTRATO;

--Somar minutos (1440 minutos tem 1 dia)
SELECT SYSDATE, SYSDATE + 15 / 1440 AS ADD_MINUTOS FROM TCONTRATO;

--Somar segundo (3600 segundos tem um dia)
SELECT SYSDATE, SYSDATE + 30 / (3600 * 24) AS ADD_SEGUNDOS FROM TCONTRATO;

--Hora fica 00:00:00
SELECT Trunc(SYSDATE) FROM DUAL;

--Diferença de meses entre datas.
SELECT Trunc(Months_Between(SYSDATE, SYSDATE-90)) AS DIF_MES FROM DUAL;

--Adiciona Meses
SELECT Trunc(Add_Months(SYSDATE, 2)) AS ADICIONA_MES_DATA FROM DUAL;

--Proxima data a partir de um dia da semana
SELECT Next_Day(SYSDATE, 'FRIDAY') AS PROXIMA_QUARTA_DATA FROM DUAL;

--Ultimo dia do Mês corrente
SELECT Last_Day(SYSDATE) AS ULTIMO_DIA_MES FROM DUAL;

--Primeiro dia do proximo mês
--Até 15 dias do mês, pega o primeiro dia do mês atual
--A partir do dia 16 do mês atual retorna o primeiro dia do próximo mês
SELECT Round(SYSDATE, 'MONTH') AS PRIMEIRO_DIA_PROXIMO_MES FROM DUAL;

--Trunc sempre mostra o primeiro do do mes corrente
SELECT Trunc(SYSDATE, 'MONTH') AS PRIMEIR_DIA_MES_CORRENTE FROM DUAL;





--DD -> dia do mês
SELECT SYSDATE, To_Char(SYSDATE, 'DD') FROM DUAL;

-- Mostra somente a data com 2 ou 4 digitos do ano
SELECT To_Char(SYSDATE, 'DD/MM/YY') FROM DUAL;
SELECT To_Char(SYSDATE, 'DD/MM/YYYY') FROM DUAL;

--Mostra o Dia e o Mês
SELECT To_Char(SYSDATE, 'DD/MM') FROM DUAL;

--Mostra somento o dia, o mês ou o ano
SELECT To_Char(SYSDATE, 'DD') FROM DUAL;
SELECT To_Char(SYSDATE, 'MM') FROM DUAL;
SELECT To_Char(SYSDATE, 'YYYY') FROM DUAL;

--Mostra o mês corrente
SELECT To_Char(SYSDATE,'MONTH') MES1 FROM DUAL;

--Dia da semana
SELECT To_Char(SYSDATE,'D') DIA_SEMANA FROM DUAL;

--Dia da semana - nome
SELECT To_Char(SYSDATE,'DY') DIA_NOME FROM DUAL;

--Mostra o nome do Ano
SELECT To_Char(SYSDATE,'YEAR') ANO_NOME FROM DUAL;

--Data por extenso
SELECT To_Char(SYSDATE,' "NOVO HAMBURGO," DAY "," DD "de" fmMonth "de" YYYY') FROM DUAL;



--EXEMPLOS COM HORA

--Hora e Minuto
SELECT To_Char(SYSDATE, 'HH24:MI') HORA_MIN FROM DUAL;

--Hora Completa
SELECT To_Char(SYSDATE, 'HH24:MI:SS') HORA_MIN FROM DUAL;

--Dia, Mês, Hora e minutos
SELECT To_Char(SYSDATE, 'DD/MM HH24:MI') DATA_HORA FROM DUAL;

--Dia, Mês, Hora, minutos e segundos
SELECT To_Char(SYSDATE, 'DD/MM HH24:MI:SS') DATA_HORA FROM DUAL;

--Dia, Mês, Ano, Hora, minutos e segundos
SELECT To_Char(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') DATA_HORA FROM DUAL;


--OUTROS EXEMPLOS DE TO_CHAR

--L -> R$
--G -> ponto
--D -> casas decimais
SELECT * FROM TALUNO;

SELECT To_Char(Salario, 'L9999.99') salario, To_Char(Salario, 'L99G999D99') salario2 FROM TALUNO;


SELECT 'R$    ' || (Round(Salario,2)) AS salario FROM TALUNO;

--Trim - Tira os espaços em branco
SELECT Trim(To_Char(Salario, 'L9999.99')) salario , To_Char(Salario, 'L99G999D99') salario2 FROM TALUNO;

--NVL e NVL2 (Quando queremos retornar Null como 0.
--NVL2 é como if,else - Se for Null retorna -1, se não retorna TOTAL
--NVL2 Geralmente usa-se quando é utilizado duas colunas, do contrario, caso queira o resultado na mesma coluna, usa o NVL.

SELECT * FROM TCONTRATO;

SELECT Total,
  Desconto,
  Desconto+Total,
  Nvl(Desconto,0) desconto1,
  Nvl(Desconto,0) + TOTAL,
  Nvl2(DESCONTO, TOTAL, -1)
FROM TContrato;

