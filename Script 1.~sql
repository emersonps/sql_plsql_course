create tablespace tbs_dados
datafile 'C:\oraclexe\app\oracle\oradata\tbd_dados.dbf' size 100M reuse
autoextend on next 10M maxsize 200M
online;
--(Cria espaco para criar tabelas e objeto, procedures, function, etc)


create user aluno --usuario
identified by "123"  --senha
default tablespace tbs_dados
temporary tablespace temp;
--(Quando conectarmos nesse usuario, ele tera disponivel os objetos da tablespace(onde ele se conecta) criado acima)

--(O usuario aluno nao pode fazer nada se nao for dado as permissoes - segue abaixo)
create role perfil_desenv;

grant
create cluster,
create database link,
create procedure,
create session,
create sequence,
create synonym,
create table,
create any type,
create trigger,
create view
to perfil_desenv;

--Adiocionamos o perfil role ao perfil_desenv, para adicionar qualquer tipo de permissao ao usuario)
grant alter session to perfil_desenv;

--(para adicionar uma permissao direta ao usuario)
grant create trigger to aluno;

--(se quiser adicionar todas as permissoes do perfil a um usuario)
grant perfil_desenv to aluno;

--(esse usuario tem a permissao para usar todo o espaco da TABLESPACE)
grant unlimited tablespace to aluno;