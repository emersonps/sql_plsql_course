--CAPÍTULO 16 - Tipos de Dado Record e Collections - 20/07/2018
--Exemplo 1 - Record
DECLARE
  TYPE Rec_Aluno IS RECORD
  (
    cod_aluno NUMBER NOT NULL := 0,
    nome TALUNO.Nome%TYPE,
    cidade TALUNO.Cidade%TYPE
  );

  Registro rec_aluno;

BEGIN
  registro.cod_aluno := 50;
  registro.nome := 'Master';
  registro.cidade := 'Novo Hamburgo';
  Dbms_Output.Put_Line('Codigo: '||registro.cod_aluno);
  Dbms_Output.Put_Line('Nome: '||registro.nome);
  Dbms_Output.Put_Line('Cidade: '||registro.cidade);
END;



--Exemplo 2 - Record
DECLARE
  reg TAluno%ROWTYPE; --Record - Permite acessar colunas dessa visão (tabela) - Receve a estrutura toda da tabela.
  vcep VARCHAR(10) := '98300000';
BEGIN
   SELECT COD_ALUNO, NOME, CIDADE
   INTO Reg.cod_aluno, Reg.nome, Reg.cidade
   FROM TALUNO
   WHERE COD_ALUNO = 1;

   reg.cep := '93500000';
   reg.salario := 1500;

   Dbms_Output.Put_Line('Codigo:  '     ||reg.cod_aluno);
   Dbms_Output.Put_Line('Nome:    '     ||reg.nome);
   Dbms_Output.Put_Line('Cidade:  '     ||reg.cidade);
   Dbms_Output.Put_Line('Cep:     '     ||reg.cep);
   Dbms_Output.Put_Line('Salario:     '     ||reg.salario);
END;

--Exemplo 3 - Record
DECLARE
  TYPE T_ALUNO IS TABLE OF TALUNO.NOME%TYPE -- Esse type recebe a mesma estrutura da coluna nome e vai ser uma Matriz(TABLE OF)
  INDEX BY BINARY_INTEGER; --Matriz - Acesso aos elementos atraves de um nume inteiro.

  REGISTRO T_ALUNO; --Record - Registro T_ALUINO que é diferente da tabela TALUNO.
BEGIN
  REGISTRO(1) := 'MARCIO'; --Acessar os Elementos
  REGISTRO(2) := 'JOSE';
  REGISTRO(3) := 'PEDRO';
  Dbms_Output.Put_Line('Nome 1: ' || registro(1)); -- Buscar os Elementos
  Dbms_Output.Put_Line('Nome 2: ' || registro(2));
  Dbms_Output.Put_Line('Nome 3:'  || registro(3));
END;

SELECT cod_aluno, NOME
FROM tALUNO WHERE COD_ALUNO = 1;


--Exemplo 3 - Record
DECLARE
  TYPE nome_type IS TABLE OF taluno.nome%TYPE;
  nome_table nome_type := nome_type(); --Criando Instancia - Para poder usar o nome_table
BEGIN
  nome_table.EXTEND; --alocando uma nova linha --Para poder adicionar linha (1), (2), etc...
  nome_table(1) := 'Pedro';
  nome_table.EXTEND; --alocando uma nova linha
  nome_table(2) := 'Marcio';
  Dbms_Output.Put_Line('Nome 1:' ||nome_table(1));
  Dbms_Output.Put_Line('Nome 2:' ||nome_table(2));
END;

--Exemplo 4 - Record - 31/07/2018
DECLARE
  TYPE tipo IS TABLE OF VARCHAR2(30) INDEX BY VARCHAR2(2);
  uf_capital tipo;
BEGIN
  uf_capital('RS') := 'PORTO ALEGRE';
  uf_capital('RJ') := 'RIO DE JANEIRO';
  uf_capital('PR') := 'CURITIBA';
  uf_capital('MT') := 'CUIABA';
  Dbms_Output.put_line(uf_capital('RS'));
  Dbms_Output.put_line(uf_capital('RJ'));
  Dbms_Output.put_line(uf_capital('PR'));
  Dbms_Output.put_line(uf_capital('MT'));
END;

--Exemplo 5 - Record - 31/07/2018

--limitanto VARRAY e extendendo até o limite
DECLARE
  TYPE nome_varray IS VARRAY(5) OF taluno.nome%TYPE;
  nome_vetor nome_varray := nome_varray();
BEGIN
  nome_vetor.EXTEND;
  nome_vetor(1) := 'Marcio';
  nome_vetor.EXTEND;
  nome_vetor(2) := 'Pedro';
  nome_vetor.EXTEND;
  nome_vetor(3) := 'Maria';
  nome_vetor.EXTEND;
  nome_vetor(4) := 'Jose';
  nome_vetor.EXTEND;
  nome_vetor(5) := 'Paulo';

  Dbms_Output.Put_Line(nome_vetor(1));
  Dbms_Output.Put_Line(nome_vetor(2));
  Dbms_Output.Put_Line(nome_vetor(3));
  Dbms_Output.Put_Line(nome_vetor(4));
  Dbms_Output.Put_Line(nome_vetor(5));
END;

