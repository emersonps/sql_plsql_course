--CAPITULO 8DML

--FAZER COPIA DOS DADOS DE UMA TABELA EXISTENTE.
CREATE TABLE TDESCONTO2
  AS SELECT * FROM TDESCONTO;

--FAZER COPIA DE UMA TABELA - APENAS A ESTRUTURA.
CREATE TABLE TDESCONTO2
  AS SELECT * FROM TDESCONTO WHERE ROWID IS NULL;

SELECT * FROM TDESCONTO2;

INSERT INTO TDESCONTO (CLASSE, INFERIOR, SUPERIOR)
VALUES ('&cla',&inf,&sup);

SELECT * FROM TDESCONTO
WHERE CLASSE = '&cla';

UPDATE TDESCONTO SET
INFERIOR = &inf,
SUPERIOR = &sup
WHERE CLASSE = '&cla';

DELETE FROM TDESCONTO
WHERE CLASSE = '&cla';

DELETE FROM TDESCONTO2;

--TRANSI��O (COMMIT/ROLLBACK)
ROLLBACK; --SOMENTE PARA INSERT, UPDATE E DELETE
COMMIT;


--DELETA TODOS OS REGISTRO DA TABELA
--N�O TEM CL�USULA WHERE
TRUNCATE TABLE TDESCONTO2; --N�O GERA LOG, � COMO SHIFT + DELETE

SELECT * FROM TDESCONTO;



--SAVEPOINT - Serve para criar um ponto de restaura��o
SAVEPOINT upd_b;

UPDATE TDESCONTO SET
SUPERIOR = 88
WHERE CLASSE = 'B';

SAVEPOINT upd_a;

UPDATE TDESCONTO SET
SUPERIOR = 88
WHERE CLASSE = 'A';

--PONTO DE RESTAURA��O
SAVEPOINT ins_ok;

INSERT INTO TDESCONTO (CLASSE, INFERIOR, SUPERIOR)
VALUES ('&cla', &inf, &sup);


ROLLBACK TO SAVEPOINT upd_b;
ROLLBACK TO SAVEPOINT upd_a;
ROLLBACK TO SAVEPOINT ins_ok;

SELECT * FROM TDESCONTO;

DROP TABLE TDESCONTO2;


