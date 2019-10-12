--CHECKLIST


--1
SELECT * FROM Cliente
where n_cadastro between 1 and 2;

--2
SELECT * FROM Cliente
where nascimento between '01-JAN-70' and '01-JAN-73';

--3
SELECT * FROM FILME
WHERE NOME LIKE 'K%';


--4
SELECT * FROM FILME
WHERE nome IN (SELECT NOME FROM FILME WHERE FILM_id =1);

--5
SELECT * FROM FILME
WHERE nome IN (SELECT NOME FROM FILME WHERE FILM_id =1);

--6
SELECT * FROM FILME
ORDER BY NOME;




--Gabriel : 7-12

-- 7
CREATE VIEW clienteINFO as
SELECT n_cadastro,
CPF, Nascimento
FROM Cliente

-- 8 
SELECT *
FROM clienteINFO
WHERE Nascimento is not null

-- 9
DROP VIEW clienteINFO

-- 10

ALTER TABLE Filme
ADD CONSTRAINT CHK_idFilm CHECK(Film_ID >= 0)

-- 11
ALTER TABLE Assento
ADD CONSTRAINT PK_Assento PRIMARY KEY(Fileira, Numero)

-- 12
ALTER TABLE Ingresso
ADD CONSTRAINT FK_Ingresso FOREIGN KEY (Assento_Fileira, Assento_Numero) REFERENCES Assento(Fileira, Numero)

--13
alter table ingresso
modify preco default 10.0

--14
alter table generofilme
modify genero varchar(20)

--15
alter table generofilme
add faixa_etaria int

--16
alter table generofilme
drop column faixa_etaria ;

--17
Select ingresso.preco , ingresso.preco + 2.0 as Novo_Preco
from ingresso;

--18
Select AVG(i.preco)
From ingresso i

-- 19-24
--Parte de victor hugo


--25 Junção entre três tabelas + condição de seleção (M:N)
-- registros de sexos de funcionarios que trabalham em sessoes de filmes
select funcionario.sexo, trabalha.sessao_sala, sessao.evento
from funcionario
inner join trabalha on funcionario.id_func = trabalha.funcionario_id
inner join sessao on trabalha.sessao_sala = sessao.sala
where sessao.evento = 'Filme'

--26 uso de inner join
-- seleciona todos os filmes que tem sessao
select sessao.film_id, filme.nome
from sessao
inner join filme on sessao.film_id = filme.film_id

--27 uso de left outer join
select sessao.film_id, filme.nome
from sessao
left outer join filme on sessao.film_id = filme.film_id

--28 uso de right outer join
select funcionario.sexo, trabalha.sessao_sala
from funcionario
right outer join trabalha on funcionario.id_func = trabalha.funcionario_id

--29 uso de full outer join
select funcionario.sexo, trabalha.sessao_sala
from funcionario
full outer join trabalha on funcionario.id_func = trabalha.funcionario_id

--30 Uma subconsulta com uso de ANY ou SOME
-- seleciona todos os nomes de filmes que possuem sessoes 3d
select nome
from filme
where film_id = any (select film_id from sessao where tresd = 1)

--31
SELECT Nascimento FROM Cliente 
WHERE n_cadastro = ALL (SELECT n_cadastro_Estudo FROM Estudante WHERE UNE = 1);

--32
SELECT DISTINCT (Funcionario_id),Funcao 
FROM Trabalha 
WHERE NOT EXISTS (SELECT Funcionario_id FROM Funcionario WHERE salario > 100);

--33
SELECT Nome AS Titulo 
FROM Filme 
WHERE Film_ID  IN (SELECT Film_ID AS TitFilm FROM Sessao WHERE Horario IN 
		(SELECT Sessao_hor AS Horadoshow FROM Trabalha WHERE Funcao ='Limpeza'));

--34
SELECT comida FROM Comida_Carrinho 
UNION
SELECT bebida FROM Bebida_Carrinho
ORDER BY comida;

--35
SELECT n_cadastro FROM Cliente WHERE CPF = '4444'
INTERSECT
SELECT n_cadastro_Comum FROM Comum;

--36
SELECT n_cadastro  FROM Cliente
MINUS 
SELECT n_cadastro_Comum  FROM Comum;

--37*gabriel

--38
update funcionario
set salario = ( select max(salario) from funcionario)
    where salario < (select avg(salario) from funcionario);

--39
--Victor Hugo

--40 grant
grant select
on filme
to public

--41 revoke
revoke select
on filme
from public

--42
SELECT * FROM (SELECT * FROM FILME) ;

--43 = Gabriel
SELECT SUM(Preco)
FROM Ingresso
WHERE Assento_Numero = '7' OR Assento_Numero = '8' OR Assento_Numero = '9' ;

--44
select f.id_func
from funcionario f
where f.salario  between (select min(salario) from funcionario) 
    and (select avg(salario) from funcionario);

--45 = Victor Hugo


--46 Order by com mais de dois campos
-- seleciona todas as colunas e retorna uma tabela ordenada por nome e data de estreia
select *
from filme
order by nome, estreiadata

--47
SELECT *
FROM CLIENTE
WHERE EXISTS ( SELECT * FROM ESTUDANTE WHERE ESTUDANTE.n_cadastro_Estudo = CLIENTE.n_cadastro ) OR EXISTS ( SELECT * FROM COMUM WHERE CLIENTE.n_cadastro = COMUM.n_cadastro_Comum );



--48
DECLARE

    teste INT;

BEGIN

    dbms_output.put_line('Hello World');
    
END;


--49
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN
    
    erro := teste/erro;
    dbms_output.put_line('Hello WOrld');
    
exception 

    WHEN ZERO_DIVIDE THEN
        dbms_output.put_line('divisão por zero');
        
end;



--50
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN
    
 
    IF (TESTE = 0) THEN
    
        dbms_output.put_line('É igual a 0');
    
    ELSE  
        dbms_output.put_line('Não é 0');
        
    end if;
 
 
 
end;


--51
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN
    
    IF (TESTE = 9) THEN
    
        dbms_output.put_line('É igual a 9');
    
    ELSIF (TESTE = 1) THEN
    
        dbms_output.put_line('É igual a 1');
    
    ELSE  
        dbms_output.put_line('Não é 1 nem 9');
        
    end if;
 
 
 
end;



--52
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN
    
    CASE TESTE
        WHEN  9 THEN
    
        dbms_output.put_line('É igual a 9');
    
    
        WHEN  1 THEN
    
        dbms_output.put_line('É igual a 1');
    
    ELSE  
        dbms_output.put_line('Não é 1 nem 9');
        
    END CASE;
 
 
 
END;




--53
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN
    
    for i in 1..10 loop
    
        dbms_output.put_line(i);
    
    end loop;
 
 
end;

--54 - 59 = Gabriel

--60 - 63 = Victor Hugo






--64 e 65
CREATE OR REPLACE PROCEDURE idade_Cliente(nascimento IN DATE, idade OUT NUMBER) IS
    BEGIN
        idade := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM nascimento);
    END; 

--66
DECLARE 
   a number;
   scale number;
PROCEDURE scaleNumber(x IN OUT number, scale IN number) IS 
BEGIN 
  x := x * scale; 
END;  
BEGIN 
   a:= 23;
   scale:= 7;
   scaleNumber(a, scale); 
   dbms_output.put_line(' 23 scaled by ' || scale || ' is: ' || a); 
END; 
/

--67
DECLARE 
   a number;
   scale number;
   
PROCEDURE scaleNumber(x IN OUT number, scale IN number) IS 
BEGIN 
  x := x * scale; 
END;  
PROCEDURE scaleAndSumNumber(x IN OUT number, scale IN number) IS 
BEGIN 
    
    
  scaleNumber(x,scale);
  x := x + scale; 
END;  
BEGIN 
   a:= 23;
   scale:= 7;
   scaleAndSumNumber(a, scale); 
   dbms_output.put_line(' 23 scaled and summed by ' || scale || ' is: ' || a); 
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
   b:= 45;  
   c := ones; 
   dbms_output.put_line(' ones: ' || c); 
END; 
/ 

--69-71 = Victor Hugo


--72, 90 Criação de pacote uso de dois componentes declarados no pacote
create or replace package my_pkg as

    function GetSalario(id_funcionario number)
        return number;
    function GetSexo(id_funcionario char)
        return varchar;

end my_pkg;
/
create or replace package body my_pkg AS
    create or replace function GetSalario(id_funcionario number)
    return number is funcionario_salario number
    begin
        select salario into funcionario_salario from funcionario where id_func = id_funcionario
        
        return salario
    end;
    
    create or replace function GetSexo(id_funcionario)
    return number is funcionario_sexo varchar
    begin
        select sexo into funcionario_sexo from funcionario where id_func = id_funcionario
        
        return funcionario_sexo
    end;
END my_pkg;
/

--73, 76 before trigger
-- trigger quando tenta-se inserir um filme mais antigo que o dia 31 de janeiro de 2000
create or replace trigger dataTrigger
before insert or update on filme
for each row
begin
    if (:new.estreiadata < '31-jan-00') then
        raise_application_error(-20003, 'filme deve ser mais recente que 31-jan-00');
    end if;
end;
-- exemplo
insert into filme (nome, film_id, estreiadata)
values ('O poderoso chefao', 13, '01-JAN-1972')

--74, 75 after trigger e 
-- trigger toda vez que atualiza o status de disponibilidade 3d em uma sessao
create or replace trigger update3d
after update of tresd on sessao
for each row
begin
    if (:new.tresd = 1) then
        dbms_output.put_line('filme agora tem 3D!');
    end if;
end;
-- query demo:
update sessao
set tresd = 1
where sala = 'zero'

--77 trigger de comando
CREATE OR REPLACE TRIGGER deleteIngresso
BEFORE DELETE
ON Ingresso
DECLARE
	dia VARCHAR2(2);
BEGIN
	dia := EXTRACT(day FROM sysdate);
	IF dia = '21' THEN	
RAISE_APPLICATION_ERROR(-20017, 'O dono nao gosta de deletar ingressos no dia 21 do mes pra nao dar azar!');
	END IF;
END deleteIngresso;
--exemplo
delete from ingresso where 

--78
CREATE OR REPLACE TRIGGER SeExisteCadmai0 
BEFORE INSERT ON Cliente
FOR EACH ROW
WHEN(NEW.n_cadastro >0)
BEGIN 
    DBMS_OUTPUT.PUT_LINE('O numero de cadastro eh valido.');
END;
-- exemplo
INSERT INTO Cliente (n_cadastro, CPF,Nascimento) VALUES (7,7777,to_date ('29/08/1933', 'DD/MM/YYYY'));



--79
CREATE OR REPLACE TRIGGER SeVelCadmai0 
BEFORE DELETE ON Cliente
FOR EACH ROW
WHEN(OLD.n_cadastro >0)
BEGIN 
    DBMS_OUTPUT.PUT_LINE('O numero de cadastro era valido.');
END;
--exemplo
DELETE FROM Cliente WHERE CPF = '3333';

--80
CREATE OR REPLACE TRIGGER SeCPFNovo!Ant
BEFORE UPDATE ON Cliente
FOR EACH ROW
WHEN(NEW.CPF <> OLD.CPF)
BEGIN 
    DBMS_OUTPUT.PUT_LINE('CPFS DIFERENTES');
END;
--exemplo
UPDATE Cliente SET CPF = '9999' WHERE n_cadastro = 2;

--81
CREATE OR REPLACE TRIGGER NPodeInsere
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN 
    RAISE_APPLICATION_ERROR(-20011,'NAO FOI POSSIVEL REALIZAR ESSA OPERACAO');
END;
--exemplo 
INSERT INTO Cliente (n_cadastro, CPF,Nascimento) VALUES (8,8888,to_date ('29/08/1935', 'DD/MM/YYYY'));

--82
CREATE OR REPLACE TRIGGER NPodeMuda
BEFORE UPDATE ON Cliente
FOR EACH ROW
BEGIN 
    RAISE_APPLICATION_ERROR(-20012,'NAO FOI POSSIVEL REALIZAR ESSA OPERACAO');
END;
--exemplo
UPDATE Cliente SET CPF = '9999' WHERE n_cadastro = 3;

--83
CREATE OR REPLACE TRIGGER NPodeDeleta
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN 
    RAISE_APPLICATION_ERROR(-20013,'NAO FOI POSSIVEL REALIZAR ESSA OPERACAO');
END;
--exemplo
DELETE FROM Cliente WHERE CPF = '5555';

--84
CREATE OR REPLACE TRIGGER INSNoLuga
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN 
    INSERT INTO Comida_Carrinho(ID_Carrinho, comida) VALUES(1, 'piposs');
    DBMS_OUTPUT.PUT_LINE('VALORES INSERIDOS EM COMIDA_CARRINHO!');
END;
--exemplo

--85 - Ximenes



--86.
-- deleta sessao toda vez que deleta filme
create or replace trigger deleteSessaoWhenDeleteFilme
after delete on filme
for each row
begin
    delete from sessao where film_id = :old.film_id;
end;

--87





--88-89 = Gabriel
--89 = XImenes

--91
CREATE OR REPLACE TRIGGER t1
INSTEAD OF INSERT
ON minhaview
DECLARE
BEGIN
DBMS_OUTPUT.PUT_LINE('FUNCIONA PFV');
END;
--exemplo
