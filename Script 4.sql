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

--Trunc sempre mostra o primeiro doa do mes corrente
SELECT Trunc(SYSDATE, 'MONTH') AS PRIMEIR_DIA_MES_CORRENTE FROM DUAL;






