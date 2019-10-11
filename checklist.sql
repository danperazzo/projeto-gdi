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

--38
update funcionario
set salario = ( select max(salario) from funcionario)
    where salario < (select avg(salario) from funcionario);

--39
delete from comida_carrinho
where id_carrinho = (select id_car 
                    from carrinhodecomida 
                    where revisao < to_date('01/01/2011','DD/MM/YYYY') 
                    );
--testando 39
select * from comida_carrinho;

--44
select f.id_func
from funcionario f
where f.salario  between (select min(salario) from funcionario) 
    and (select avg(salario) from funcionario);


--45
select g.genero, f.nome, s.iniciodata
from generofilme g inner join filme f on (f.film_id = g.ID_filme)
inner join sessao s on (f.film_id = s.film_ID);


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
/

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
/


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
/

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
/


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
/



--53
DECLARE

    teste INT := 9;
    erro INT := 0;

BEGIN
    
    for i in 1..10 loop
    
        dbms_output.put_line(i);
    
    end loop;
 
 
end;
/



--64 e 65
CREATE OR REPLACE PROCEDURE idade_Cliente(nascimento IN DATE, idade OUT NUMBER) IS
    BEGIN
        idade := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM nascimento);
    END; 
    
--69
create or replace function mostra_lan(titulo in varchar) return date is
    dia date;
begin
    select s.iniciodata into dia from sessao s
    where s.film_id in (select film_id from filme where nome = titulo);
    return dia;
end;
/

--70
create or replace function mostra_aniv(ide in int, dia out date) return date is
begin
    select f.aniversario into dia from funcionario f
    where f.id_func = ide;
    return dia;
end;
/

--71
create or replace function salario_ano(ide IN int, sal in out int) return int is
begin
    sal := sal*12;
    return sal;
end;
/

--89
create or replace function DadoFilme(titulo varchar) return Filme%rowtype is
    lin filme%rowtype;
begin
    select * into lin from Filme f where titulo = f.nome;
    return lin;
end;
/

--testando 89
declare
    lin filme%rowtype;
begin
    lin := DadoFilme('Bill Kill Bill');
    dbms_output.put_line(lin.nome ||' ' || lin.film_id|| ' ' || lin.estreiadata ||' '|| lin.seq_id);
end;
/
