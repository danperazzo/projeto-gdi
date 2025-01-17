--CHECKLIST


--1
SELECT *
FROM Cliente
where n_cadastro between 1 and 2;

--2
SELECT *
FROM Cliente
where nascimento between '01-JAN-70' and '01-JAN-73';

--3
SELECT *
FROM FILME
WHERE NOME LIKE 'K%';


--4
SELECT *
FROM FILME
WHERE nome IN (SELECT NOME
FROM FILME
WHERE FILM_id =1);

--5
SELECT *
FROM FILME
WHERE seq_id is null;

SELECT *
FROM FILME
WHERE seq_id is not null;

--6
SELECT *
FROM FILME
ORDER BY NOME;




--Gabriel : 7-12

-- 7
CREATE VIEW clienteINFO
as
    SELECT n_cadastro,
        CPF, Nascimento
    FROM Cliente;

-- 8 
SELECT *
FROM clienteINFO
WHERE Nascimento is not null;

-- 9
DROP VIEW clienteINFO;

-- 10

ALTER TABLE Filme
ADD CONSTRAINT CHK_idFilm CHECK(Film_ID >= 0);

-- 11
ALTER TABLE Assento
ADD CONSTRAINT PK_Assento PRIMARY KEY(Fileira, Numero);

-- 12
ALTER TABLE Ingresso
ADD CONSTRAINT FK_Ingresso FOREIGN KEY (Assento_Fileira, Assento_Numero) REFERENCES Assento(Fileira, Numero);

--13
alter table ingresso
modify preco default 10.0;

--14
alter table generofilme
modify genero varchar
(20);

--15
alter table generofilme
add faixa_etaria int;

--16
alter table generofilme
drop column faixa_etaria ;

--17
Select ingresso.preco , ingresso.preco + 2.0 as Novo_Preco
from ingresso;

--18
Select AVG(i.preco)
From ingresso i;

--20
select DISTINCT g.genero
from GeneroFilme g;


select f.Nome
from Filme f
where f.Film_ID in (select g.ID_filme
from GeneroFilme g
where g.genero = 'Drama');
--21, 19
select g.genero, min(f.Nome) as primeiro_em_ordem_alfabetica
from Filme f, GeneroFilme g
where f.Film_ID = g.ID_filme
group by g.genero
having g.genero != 'Ficcao';

--22, 23
select g.genero, min(f.Nome) as primeiro_em_ordem_alfabetica
from Filme f, GeneroFilme g
where f.Film_ID = g.ID_filme
group by g.genero
having min(f.Nome) = (select max(f.Nome)
from Filme fi, GeneroFilme ge
where ge.genero = g.genero
group by g.genero);

--24
select f.nome, s.iniciodata
from sessao s join filme f on (f.film_id = s.film_ID);


--25 Junção entre três tabelas + condição de seleção (M:N)
-- registros de sexos de funcionarios que trabalham em sessoes de filmes
select funcionario.sexo, trabalha.sessao_sala, sessao.evento
from funcionario
    inner join trabalha on funcionario.id_func = trabalha.funcionario_id
    inner join sessao on trabalha.sessao_sala = sessao.sala
where sessao.evento = 'Filme';

--26 uso de inner join
-- seleciona todos os filmes que tem sessao
select sessao.film_id, filme.nome
from sessao
    inner join filme on sessao.film_id = filme.film_id;

--27 uso de left outer join
select sessao.film_id, filme.nome
from sessao
    left outer join filme on sessao.film_id = filme.film_id;

--28 uso de right outer join
select funcionario.sexo, trabalha.sessao_sala
from funcionario
    right outer join trabalha on funcionario.id_func = trabalha.funcionario_id;

--29 uso de full outer join
select funcionario.sexo, trabalha.sessao_sala
from funcionario
    full outer join trabalha on funcionario.id_func = trabalha.funcionario_id;

--30 Uma subconsulta com uso de ANY ou SOME
-- seleciona todos os nomes de filmes que possuem sessoes 3d
select nome
from filme
where film_id = any (select film_id
from sessao
where tresd = 1);

--31
SELECT Nascimento
FROM Cliente
WHERE n_cadastro = ALL (SELECT n_cadastro_Estudo
FROM Estudante
WHERE UNE = 1);

--32
SELECT DISTINCT (Funcionario_id), Funcao
FROM Trabalha
WHERE NOT EXISTS (SELECT Funcionario_id
FROM Funcionario
WHERE salario > 100);

--33
SELECT Nome AS Titulo
FROM Filme
WHERE Film_ID  IN (SELECT Film_ID AS TitFilm
FROM Sessao
WHERE Horario IN 
		(SELECT Sessao_hor AS Horadoshow
FROM Trabalha
WHERE Funcao ='Limpeza'));

--34
    SELECT comida
    FROM Comida_Carrinho
UNION
    SELECT bebida
    FROM Bebida_Carrinho
ORDER BY comida;

--35
    SELECT n_cadastro
    FROM Cliente
    WHERE CPF = '4444'
INTERSECT
    SELECT n_cadastro_Comum
    FROM Comum;

--36
SELECT n_cadastro
FROM Cliente
MINUS
SELECT n_cadastro_Comum
FROM Comum;

-- 37 

INSERT INTO Filme
VALUES (SELECT * FROM Filme film WHERE film.Film_ID = 0);


--38
update funcionario
set salario = ( select max(salario)
from funcionario)
    where salario < (select avg(salario)
from funcionario);

--39

delete from comida_carrinho
where id_carrinho = (select id_car
from carrinhodecomida
where revisao < to_date('01/01/2011','DD/MM/YYYY') 
                    );
--testando 39
select *
from comida_carrinho;


--40 grant
grant select
on filme
to public;

--41 revoke
revoke select
on filme
from public;

--42
SELECT *
FROM (SELECT *
    FROM FILME)
;

--43 
SELECT SUM(Preco)
FROM Ingresso
WHERE Assento_Numero = '7' OR Assento_Numero = '8' OR Assento_Numero = '9'
;


--44
select f.id_func
from funcionario f
where f.salario  between (select min(salario)
from funcionario) 
    and (select avg(salario)
from funcionario);


--45
select g.genero, f.nome, s.iniciodata
from generofilme g inner join filme f on (f.film_id = g.ID_filme)
    inner join sessao s on (f.film_id = s.film_ID);


--45
select g.genero, f.nome, s.iniciodata
from generofilme g inner join filme f on (f.film_id = g.ID_filme)
    inner join sessao s on (f.film_id = s.film_ID);


--46 Order by com mais de dois campos
-- seleciona todas as colunas e retorna uma tabela ordenada por nome e data de estreia
select *
from filme
order by nome, estreiadata;

--47
SELECT *
FROM CLIENTE
WHERE EXISTS ( SELECT *
    FROM ESTUDANTE
    WHERE ESTUDANTE.n_cadastro_Estudo = CLIENTE.n_cadastro ) OR EXISTS ( SELECT *
    FROM COMUM
    WHERE CLIENTE.n_cadastro = COMUM.n_cadastro_Comum );



--48
DECLARE

    teste INT;

BEGIN

    dbms_output.put_line
('Hello World');

END;
/

--49
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN
    
    erro := teste/erro;
    dbms_output.put_line
('Hello WOrld');
    
exception 

    WHEN ZERO_DIVIDE THEN
        dbms_output.put_line
('divisão por zero');

end;
/


--50
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN


    IF (TESTE = 0) THEN
    
        dbms_output.put_line
    ('É igual a 0');

ELSE  
        dbms_output.put_line
('Não é 0');

end
if;
 
 
 
end;
/

--51
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN

    IF (TESTE = 9) THEN
    
        dbms_output.put_line
    ('É igual a 9');

ELSIF
(TESTE = 1) THEN
    
        dbms_output.put_line
('É igual a 1');
    
    ELSE  
        dbms_output.put_line
('Não é 1 nem 9');

end
if;
 
 
 
end;
/


--52
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN

    CASE TESTE
        WHEN  9 THEN
    
        dbms_output.put_line
    ('É igual a 9');


WHEN  1 THEN
    
        dbms_output.put_line
('É igual a 1');
    
    ELSE  
        dbms_output.put_line
('Não é 1 nem 9');

END CASE;



END;
/



--53, 55
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN

    for i IN 1..10 LOOP
    
        dbms_output.put_line
    (i);

END LOOP;


END;

-- 54 

DECLARE

CURSOR cur IS (SELECT * FROM Filme);

film Filme%ROWTYPE;

BEGIN

OPEN cur;
FETCH cur INTO film;

WHILE (cur%FOUND)
    LOOP
        dbms_output.put(film.Nome);
        FETCH cur INTO film;
    END LOOP;
CLOSE cur;

END;

-- 56
DECLARE
	x number;
BEGIN
    SELECT n_cadastro
    INTO x
    FROM Cliente
    WHERE n_cadastro = 1;

    dbms_output.put_line
    (x);

END;

-- 57

DECLARE
	TYPE Cliente IS RECORD
(
		n_cadastro NUMBER,
		CPF NUMBER
);
cliente Cliente;
BEGIN
    for c in(SELECT *
    INTO cliente
	FROM Cliente
	WHERE n_cadastro > 1 AND CPF > 0)

    LOOP
    cliente := c.Cliente 
    END LOOP
END;

-- 58 Output de string com variável
DECLARE
    nome_var VARCHAR(40);
BEGIN
    SELECT Nome
    INTO nome_var
    FROM Filme
    WHERE Film_ID = 2;
    dbms_output.put_line("Nome com ID de Filme 2:"|| nome_var);
END;

-- 59 
DECLARE
    cursor cliente is
SELECT *
FROM Cliente;
dadosCliente Cliente%rowtype;
BEGIN
    open cliente;
    loop
    fetch cliente
    into dadosCliente;
exit when cliente%notfound;
         DBMS_OUTPUT.PUT_LINE
(dadosCliente.cpf);
end loop;
close cliente;
END;



--60
declare 
CURSOR cur_cadastro is
select n_cadastro , cpf
from cliente;
reg_cadastro cur_cadastro%ROWTYPE;

BEGIN
    open cur_cadastro;
    loop
    fetch cur_cadastro
    into reg_cadastro;
exit when cur_cadastro%NOTFOUND;
end loop;
close cur_cadastro;
DBMS_OUTPUT.PUT_LINE
(reg_cadastro.n_cadastro || ' ' || reg_cadastro.cpf);
end;


--61

declare


CURSOR cur_cadastro
(cpf_cliente int) is
select n_cadastro , nascimento
from cliente c
where c.cpf = cpf_cliente;
reg_cadastro cur_cadastro%ROWTYPE;

BEGIN
    open cur_cadastro
    (1111);
loop
fetch cur_cadastro
into reg_cadastro;
	exit when cur_cadastro%NOTFOUND;
end loop;
close cur_cadastro;
DBMS_OUTPUT.PUT_LINE
(reg_cadastro.n_cadastro || ' ' || reg_cadastro.nascimento);
end;


--62 cursor em loop sem declare
declare 
	cpf_cliente int :=2222;

begin
    for reg_cadastro in
    ( select n_cadastro , nascimento
    from cliente c
    where c.cpf = cpf_cliente)

    loop 
    DBMS_OUTPUT.PUT_LINE
    (reg_cadastro.n_cadastro || ' ' || reg_cadastro.nascimento);
END
LOOP;
END;

--63 create or replace procedure sem parametro

create or replace procedure cadastro_e_nascimento is
CURSOR cur_cadastro is
select n_cadastro , cpf
from cliente;
reg_cadastro cur_cadastro%ROWTYPE;

BEGIN
    open cur_cadastro;
    loop
    fetch cur_cadastro
    into reg_cadastro;
exit when cur_cadastro%NOTFOUND;
end loop;
close cur_cadastro;
DBMS_OUTPUT.PUT_LINE
(reg_cadastro.n_cadastro || ' ' || reg_cadastro.cpf);
end;

-- exemplo
/
begin 
    cadastro_e_nascimento;
end;


--64 e 65
CREATE OR REPLACE PROCEDURE idade_Cliente
(nascimento IN DATE, idade OUT NUMBER) IS
BEGIN
   idade := EXTRACT
(YEAR FROM SYSDATE) - EXTRACT
(YEAR FROM nascimento);

END; 
    
    --exemplo
/
declare 
 nasc date;
idade number;
begin
         nasc := to_date
('23/10/1999' , 'DD/MM/YYYY');
         idade_Cliente
(nasc , idade);
        DBMS_OUTPUT.PUT_LINE
(idade);

end;


--66
DECLARE 
   a number;
   scale number;
PROCEDURE scaleNumber
(x IN OUT number, scale IN number) IS
BEGIN 
  x := x * scale;
END;
BEGIN
    a:
    = 23;
scale:
= 7;
   scaleNumber
(a, scale); 
   dbms_output.put_line
(' 23 scaled by ' || scale || ' is: ' || a);
END; 
/

--67
DECLARE 
   a number;
   scale number;
   
PROCEDURE scaleNumber
(x IN OUT number, scale IN number) IS
BEGIN 
  x := x * scale;
END;  
PROCEDURE scaleAndSumNumber
(x IN OUT number, scale IN number) IS
BEGIN 
    
    
  scaleNumber
(x,scale);
  x := x + scale;
END;
BEGIN
    a:
    = 23;
scale:
= 7;
   scaleAndSumNumber
(a, scale); 
   dbms_output.put_line
(' 23 scaled and summed by ' || scale || ' is: ' || a);
END; 
/


--68
DECLARE 
   b number; 
   c number;
FUNCTION ones
RETURN number
IS 
    z number;
BEGIN 
   z := 1;
RETURN z;
END;
BEGIN
    b:
    = 45;
c := ones; 
   dbms_output.put_line
(' ones: ' || c);
END; 
/

--69
create or replace function mostra_lan
(titulo in varchar)
return date
is
    dia date;
begin
    select s.iniciodata
    into dia
    from sessao s
    where s.film_id in (select film_id
    from filme
    where nome = titulo);
    return dia;
end;
/

--70
create or replace function mostra_aniv
(ide in int, dia out date)
return date
is
begin
    select f.aniversario
    into dia
    from funcionario f
    where f.id_func = ide;
    return dia;
end;
/


--71
create or replace function salario_ano
(ide IN int, sal in out int)
return int
is
begin
    sal := sal*12;
return sal;
end;
/


--72, 90 Criação de pacote uso de dois componentes declarados no pacote
create or replace package my_pkg as

    function GetSalario
(id_funcionario number)
return number;
function GetSexo
(id_funcionario char)
return varchar;

end my_pkg;
/
create or replace package body my_pkg AS
create or replace function GetSalario
(id_funcionario number)
return number
is funcionario_salario number
begin
    select salario
    into funcionario_salario
    from funcionario
    where id_func = id_funcionario

    return salario
end;

create or replace function GetSexo
(id_funcionario)
return number
is funcionario_sexo varchar
begin
    select sexo
    into funcionario_sexo
    from funcionario
    where id_func = id_funcionario

    return funcionario_sexo
end;
END my_pkg;
/

--73, 76 before trigger
-- trigger quando tenta-se inserir um filme mais antigo que o dia 31 de janeiro de 2000
create or replace trigger dataTrigger
before
insert or
update on filme
for each row
begin
    if (:new.estreiadata < '31-jan-00') then
        raise_application_error
    (-20003, 'filme deve ser mais recente que 31-jan-00');
end
if;
end;
/
-- exemplo
insert into filme
    (nome, film_id, estreiadata)
values
    ('O poderoso chefao', 13, '01-JAN-1972');

--74, 75 after trigger e 
-- trigger toda vez que atualiza o status de disponibilidade 3d em uma sessao
create or replace trigger update3d
after
update of tresd on sessao
for each row
begin
    if (:new.tresd = 1) then
        dbms_output.put_line
    ('filme agora tem 3D!');
end
if;
end;
/
-- query demo:
update sessao
set tresd = 1
where sala = 'zero';

--77 trigger de comando
CREATE OR REPLACE TRIGGER deleteIngresso
BEFORE
DELETE
ON Ingresso
DECLARE
	dia VARCHAR2
(2);
BEGIN
	dia := EXTRACT
(day FROM sysdate);
IF dia = '21' THEN	
RAISE_APPLICATION_ERROR
(-20017, 'O dono nao gosta de deletar ingressos no dia 21 do mes pra nao dar azar!');
END
IF;
END deleteIngresso;
/
--exemplo
delete from ingresso where;

--78
CREATE OR REPLACE TRIGGER SeExisteCadmai0 
BEFORE
INSERT ON
Cliente
FOR
EACH
ROW
WHEN
(NEW.n_cadastro >0)
BEGIN 
    DBMS_OUTPUT.PUT_LINE
('O numero de cadastro eh valido.');
END;
/
-- exemplo
INSERT INTO Cliente
    (n_cadastro, CPF,Nascimento)
VALUES
    (7, 7777, to_date ('29/08/1933', 'DD/MM/YYYY'));



--79
CREATE OR REPLACE TRIGGER SeVelCadmai0 
BEFORE
DELETE ON Cliente
FOR EACH
ROW
WHEN
(OLD.n_cadastro >0)
BEGIN 
    DBMS_OUTPUT.PUT_LINE
('O numero de cadastro era valido.');
END;
/
--exemplo
DELETE FROM Cliente WHERE CPF = '3333';

--80
CREATE OR REPLACE TRIGGER SeCPFNovoAnt
BEFORE
UPDATE ON Cliente
FOR EACH ROW
WHEN
(NEW.CPF <> OLD.CPF)
BEGIN 
    DBMS_OUTPUT.PUT_LINE
('CPFS DIFERENTES');
END;
/
--exemplo
UPDATE Cliente SET CPF = '9999' WHERE n_cadastro = 2;

--81
CREATE OR REPLACE TRIGGER NPodeInsere
BEFORE
INSERT ON
Cliente
FOR
EACH
ROW
BEGIN 
    RAISE_APPLICATION_ERROR
(-20011,'NAO FOI POSSIVEL REALIZAR ESSA OPERACAO');
END;
/
--exemplo 
INSERT INTO Cliente
    (n_cadastro, CPF,Nascimento)
VALUES
    (8, 8888, to_date ('29/08/1935', 'DD/MM/YYYY'));

--82
CREATE OR REPLACE TRIGGER NPodeMuda
BEFORE
UPDATE ON Cliente
FOR EACH ROW
BEGIN 
    RAISE_APPLICATION_ERROR
(-20012,'NAO FOI POSSIVEL REALIZAR ESSA OPERACAO');
END;
/
--exemplo
UPDATE Cliente SET CPF = '9999' WHERE n_cadastro = 3;

--83
CREATE OR REPLACE TRIGGER NPodeDeleta
BEFORE
DELETE ON Cliente
FOR EACH
ROW
BEGIN 
    RAISE_APPLICATION_ERROR
(-20013,'NAO FOI POSSIVEL REALIZAR ESSA OPERACAO');
END;
--exemplo
DELETE FROM Cliente WHERE CPF = '5555';

--84
CREATE OR REPLACE TRIGGER INSNoLuga
BEFORE
INSERT ON
Cliente
FOR
EACH
ROW
BEGIN
    INSERT INTO Comida_Carrinho
        (ID_Carrinho, comida)
    VALUES(1, 'piposs');
    DBMS_OUTPUT.PUT_LINE
    ('VALORES INSERIDOS EM COMIDA_CARRINHO!');
END;
/
--exemplo
INSERT INTO Cliente
    (n_cadastro, CPF,Nascimento)
VALUES
    (17, 1717, to_date ('29/08/1954', 'DD/MM/YYYY'));

--85
-- iniciando 85 para teste
drop trigger updateDescontoIngresso;

update ingresso
set desconto = 2
where sessao_horario = '11:47' and sessao_sala = 'dois';

update sessao
set iniciodata = to_date('24/03/2004', 'DD/MM/YYYY')
where film_ID= 1;

select * from ingresso;

-- 85 de fato
create or replace trigger updateDescontoIngresso
before update of InicioData on sessao
for each row

BEGIN 
    if :NEW.iniciodata != :OLD.iniciodata then
    UPDATE ingresso
    set desconto = 3
    where (sessao_horario = :OLD.horario and sessao_sala = :OLD.sala);
    DBMS_OUTPUT.PUT_LINE('VALORES ATUALIZADOS EM INGRESSO');
    end if;
    
END;

/
-- testando 85
update sessao
set iniciodata = to_date('22/03/2004', 'DD/MM/YYYY')
where film_ID= 1;

select * from ingresso;



--86.
-- deleta sessao toda vez que deleta filme
create or replace trigger deleteSessaoWhenDeleteFilme
after
delete on filme
for each
row
begin
    delete from sessao where film_id = :old.film_id;
end;

--87

--88 Registro como parâmetro de função ou procedimento

CREATE OR REPLACE PROCEDURE anivFuncionario
(funcionario_data IN Funcionario%ROWTYPE) IS
    anivFunc Aniversario.data_aniversario%TYPE;

BEGIN
    SELECT F.data_aniversario
    INTO anivFunc
    FROM Funcionario F
    WHERE funcionario_data.ID_func = F.ID_func;
    DBMS_OUTPUT.PUT_LINE
    ('O dia do aniversário do funcionário é '||funcionario_data.Aniversario||'');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE
('O aniversário não foi cadastrado');

END;

--89
create or replace function DadoFilme
(titulo varchar)
return Filme%rowtype
is
    lin filme%rowtype;
begin
    select *
    into lin
    from Filme f
    where titulo = f.nome;
    return lin;
end;
/
--testando 89
declare
    lin filme%rowtype;
begin
    lin := DadoFilme
('Bill Kill Bill');
    dbms_output.put_line
(lin.nome ||' ' || lin.film_id|| ' ' || lin.estreiadata ||' '|| lin.seq_id);
end;
/


--91
CREATE OR REPLACE TRIGGER t1
INSTEAD OF
INSERT
ON
minhaview
DECLARE
BEGIN
DBMS_OUTPUT.PUT_LINE
('FUNCIONA PFV');
END;
/
--exemplo 
CREATE VIEW minhaview
AS
    SELECT CPF
    FROM Cliente;
INSERT INTO minhaview
VALUES
    ('4444');


