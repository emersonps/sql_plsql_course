-- CAPÍTULO 14 - INTERAGINDO COM O SERVIDOR ORACLE    12/07/2018
DECLARE
  vValor  NUMBER(8,2);
  vNome   VARCHAR2(30);
BEGIN
  SELECT valor, nome --Colunas da Tabela
  INTO   vValor, vNome --Variaveis que receberao valor de um unico registro das colunas selecionadas
  FROM   tcurso --Tabela selecionada
  WHERE  cod_curso = &cod_curso;  --Console para digitar o valor do codigo do curso
  Dbms_Output.Put_Line('Valor: ' || To_Char(vValor, 'fm9999.99'));
  Dbms_Output.Put_Line('Curso: ' || InitCap(vNome));
END;

SELECT * FROM TCURSO;

--Exemplo 2
DECLARE
  vDt_compra  tcontrato.Data%TYPE; --Pega o mesmo tipo de dados do campo da tabela
  vDt_curso   tcontrato.Data%TYPE;
BEGIN
  SELECT data, data + 10
  INTO vDt_compra, vDt_curso
  FROM tcontrato
  WHERE cod_contrato = &Contrato;
  Dbms_Output.Put_Line('Data Compra: ' || vDt_compra);
  Dbms_Output.Put_Line('Data Cursos: ' || vDt_curso);
END;

--Exemplo - INSERT
SELECT * FROM TCONTRATO;
SELECT Max(COD_CONTRATO) FROM TCONTRATO;
CREATE SEQUENCE SEQ_CONTRATO START WITH 8;
SELECT SEQ_CONTRATO.CURRVAL FROM DUAL; --TRAZ O PROXIMO VALOR CORRENTE DA SEQUENCE.

--BLOCO ANÔNIMO
DECLARE
  vCod tcontrato.cod_contrato%TYPE;
BEGIN
  SELECT SEQ_CONTRATO.NEXTVAL
  INTO vCod FROM Dual;

  INSERT INTO TCONTRATO(COD_CONTRATO, DATA, COD_ALUNO, DESCONTO)
  VALUES(vCOD, SYSDATE, 2, NULL);

  Dbms_Output.Put_Line('Criado Contrato: ' || vCod);
END;

--Exemplo UPDATE
DECLARE
  vValor TCURSO.valor%TYPE := &Valor;
BEGIN
  UPDATE TCURSO SET
  Valor = Valor + vValor
  WHERE carga_horaria >= 30;
END;

SELECT * FROM TCURSO;

--Exemplo DELETE
DECLARE
  vContrato TCONTRATO.COD_CONTRATO%TYPE := &contrato;
BEGIN
  DELETE FROM TCONTRATO
  WHERE COD_CONTRATO = vContrato;
END;

SELECT * FROM TCONTRATO;

--Exemplo -Erro No_Data_Found e Select Into que não encontra registros
DECLARE
  vdt_compra  tcontrato.data%TYPE;
  vTotal      tcontrato.total%TYPE;
  vDt_atual   DATE := SYSDATE;
BEGIN
  SELECT data, total
  INTO vdt_compra, vTotal
  FROM tcontrato
  WHERE Data = vDt_atual;
END;

--Exemplo - Alterando mais de um Registro
DECLARE
  vContrato NUMBER := &cod_contrato;
  vtexto     VARCHAR2(50);
BEGIN
  UPDATE TContrato SET
  desconto = desconto + 2
  WHERE Cod_Contrato >= VContrato;

  vtexto := SQL%ROWCOUNT;
  --retorna qtde de registros afetados pelo comando sql

  Dbms_Output.Put_Line(vtexto || ' Linhas atualizadas.');
END;

SELECT * FROM TCONTRATO;

COMMIT;