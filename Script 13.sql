CAPÍTULO 13 - PL/SQL - ESCREVENDO COMANDOS EXECUTÁVEIS


--Bloco Anônimo
DECLARE
  x INTEGER; --Declarndo variáveis
  y INTEGER;
  c INTEGER;
BEGIN
  X := 10; --Atribuindo valor em uma variável
  y := 20;
  c := x + y;
  Dbms_Output.Put_Line('Resultado: '||c);
  Dbms_Output.Put_Line('');
END;


--Exemplo 2 de Uso de Variáveis
DECLARE
  VDESCONTO NUMBER(6,2) := 0.50;
  VCIDADE VARCHAR(30) := 'NOVO HAMBURGO';
  VCOD_ALUNO TALUNO.COD_ALUNO%TYPE := 5;
  VTOTAL NUMBER(8,2) := 1345.89;
BEGIN
  VTOTAL := Round(VTOTAL * VDESCONTO, 2);
  Dbms_Output.Put_Line('Total: '|| vTotal);
  VDESCONTO := 1.20;
  vCIDADE := InitCap(VCIDADE);
  Dbms_Output.Put_Line('Cidade: ' || vCidade);
  Dbms_Output.Put_Line('Desconto: ' || VDESCONTO);
  Dbms_Output.Put_Line('Aluno: ' || VCOD_ALUNO);
END;

--Exemplo 3 Usando Tabela
SELECT * FROM TCURSO;
SELECT * FROM TALUNO;

DECLARE
  vPreco1 NUMBER(8,2) := 10;
  vPreco2 NUMBER(8,2) := 20;
  vFlag   BOOLEAN; --True ou False
BEGIN
  vFlag := (vPreco1 > vPreco2);
  IF (vFlag = TRUE) THEN -- Se vFlag = True ou Então
    Dbms_Output.Put_Line('Verdadeiro');
  ELSE --Senão
    Dbms_Output.Put_Line('Falso');
  END IF; --Fim do If
  IF(VPRECO1 > VPRECO2) THEN
    Dbms_Output.Put_Line('vPreco1 eh maior.');
  ELSE
    Dbms_Output.Put_Line('vPreco2 eh maior');
  END IF;
END;

--Exemplo 4 Usando Bind variable
VARIABLE vDESCONTO NUMBER  -- SEM ';' - Declara-se apenas uma vez, depois se executa a procedure quantas vezes quiser

DECLARE
  VCOD_ALUNO NUMBER := 1;
BEGIN
  :vDESCONTO2 := 0.90; --: INDICA QUE NÃO É UMA VARIAVEL INTERNA (Bind Variable)
  Dbms_Output.put_line('Desconto 3: ' || :vDESCONTO2);

  UPDATE TContrato SET
  TOTAL = TOTAL * :vDESCONTO2
  WHERE COD_ALUNO = VCOD_ALUNO;
END;

SELECT * FROM TCONTRATO;


--Aninhamento (Um bloco dentro do oputro)

--Bloco 1
DECLARE
  VTESTE VARCHAR(10) := 'JOSE';
BEGIN

  --Bloco 2
  DECLARE
    VTESTE VARCHAR(10) := 'PEDRO';
  BEGIN
    Dbms_Output.Put_Line(VTESTE);
  END;

  Dbms_Output.Put_Line(VTESTE);
END;


