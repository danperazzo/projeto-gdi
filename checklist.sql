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

--7
SELECT * FROM (SELECT * FROM FILME) ;


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


--25 Junção entre três tabelas + condição de seleção (M:N)

--26 uso de inner join

--27 uso de left outer join

--28 uso de right outer join

--29 uso de full outer join

--30 Uma subconsulta com uso de ANY ou SOME
-- seleciona todos os nomes de filmes que possuem sessoes 3d
select nome
from filme
where film_id = any (select film_id from sessao where tresd = 1)

--31 sunconsulta com all

--32 sunconsulta com exists/not exists


--38
update funcionario
set salario = ( select max(salario) from funcionario)
    where salario < (select avg(salario) from funcionario);

--44
select f.id_func
from funcionario f
where f.salario  between (select min(salario) from funcionario) 
    and (select avg(salario) from funcionario);


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




--64 e 65
CREATE OR REPLACE PROCEDURE idade_Cliente(nascimento IN DATE, idade OUT NUMBER) IS
    BEGIN
        idade := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM nascimento);
    END; 


--72 Criação de pacote (declaração e corpo) com pelo menos dois componentes


--73 before trigger
create or replace trigger datatrigger
before insert or update on filme
for each row
begin
    if (:new.estreiadata < '31-jan-00') then
        raise_application_error(-20003, 'filme deve ser mais recente que 31-jan-00');
    end if;
end;

--74 after trigger


--75 trigger de linha sem condicao


--76 trigger de linha com condicao


--77 trigger de comando

