--CAPÍTULO 18 - ESCREVENDO CURSORES EXPLICITOS
DECLARE
	vcod_aluno TAluno.cod_aluno%TYPE;
	vNome		TAluno.nome%TYPE;
	CURSOR	c1 IS
	SELECT 	cod_aluno, nome
	FROM		taluno;
BEGIN
	OPEN    c1;
	LOOP
		FETCH c1 INTO vcod_aluno, vNome;
		EXIT WHEN c1%ROWCOUNT > 10 OR c1%NOTFOUND;
    Dbms_Output.Put_Line('Codigo: '||
      LPad(vcod_aluno,4,'0') || ' - '||'Nome: '||vNome);
  END LOOP;
  CLOSE c1;
END;
