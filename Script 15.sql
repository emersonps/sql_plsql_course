--CAPITULO 15 - ESCREVENDO ESTRUTURA DE CONSTROLE - 19/07/2018
--Bloco anônimo com algumas variáveis
--Exemplo de IF ELSE
DECLARE
    vNome VARCHAR(30) := 'Paulista';
    vCidade VARCHAR(30);
    vEstado VARCHAR(2);
BEGIN
    IF (vNome = 'Gaucho') THEN
        vCidade := 'Porto Alegre';
        vEstado := 'RS';
    ELSIF (vNome = 'Carioca') THEN
        vCidade := 'Rio de Janeiro';
        vEstado := 'RJ';
    ELSE
        IF (vEstado = 'SP') THEN
            vCidade := 'Paulista';
        ELSE
            vCidade := 'Outros';
            vEstado := 'XX';
        END IF;
    END IF;
    Dbms_Output.Put_Line(vCidade || ' - ' || vEstado);
END;

--Exemplo de CASE
DECLARE
  vEstado VARCHAR(2) := 'ES';
  vNome VARCHAR(30);
BEGIN
  CASE
    WHEN vEstado = 'RS' THEN vNome := 'Gaucho'; --quando vEstado fo RS então vNome recebe Gaucho
    WHEN vEstado = 'RJ' OR vEstado = 'ES' THEN vNome := 'Carioca'; --Pode ser usado OR, AND, etc.
  ELSE
    vNome := 'Outros';
  END CASE;
  Dbms_Output.Put_Line('Apelido: ' || vNome);
END;


--Exemplo de Repetição
DECLARE
  vContador INTEGER := 0;
BEGIN
  LOOP
    vContador := vContador + 1;
    Dbms_Output.Put_Line(vContador);
    EXIT WHEN vContador = 5;
  END LOOP;
  Dbms_Output.Put_Line('Fim do LOOP');
END;

--Exemplo For Loop - Mais indicado para laços em tabelas
DECLARE
  vContador INTEGER;
BEGIN
  FOR vContador IN 1..5
  LOOP
    Dbms_Output.Put_Line('For Loop: ' || vContador);
  END LOOP;
END;

--Exemplo WHILE LOOP
DECLARE
  vContador INTEGER := 0;
  vTexto    VARCHAR(10);
BEGIN
  WHILE vContador < 5
  LOOP
    vContador := vContador + 1;
    IF (vContador Mod 2) = 0 THEN
      vTexto := 'Par';
    ELSE
      vTexto := 'Impar';
    END IF;
    Dbms_Output.Put_Line(vContador || ' -> ' || vTexto);
  END LOOP;
END;

--Obs.: O mais usado é For Loop