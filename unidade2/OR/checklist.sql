--CHECKLIST

--1 (Daniel)
CREATE OR REPLACE TYPE tp_Filho_check AS OBJECT(
    n_cadastro_pai NUMBER,
    IdFilho NUMBER,
    Nascimento DATE,
    Cadeirinha VARCHAR(1)
)NOT FINAL;
/
--2 (Daniel)

CREATE OR REPLACE TYPE tp_Comida_Carrinho_check AS OBJECT(
    comida VARCHAR(10)
    )NOT FINAL;
    
/


CREATE OR REPLACE TYPE tp_Bebida_Carrinho_check AS OBJECT(
    bebida VARCHAR(10)
    )NOT FINAL;
/


CREATE OR REPLACE TYPE tp_CarrinhoDeComida_check AS OBJECT(
    ID_car INT,
    Revisao DATE,
    comida tp_Comida_Carrinho_check,
    bebida  tp_Bebida_Carrinho_check
    )NOT FINAL;
/

--3 (Daniel)

CREATE OR REPLACE TYPE tp_telefones_check AS VARRAY(10) OF VARCHAR2(15);

/

--4 (Daniel)

CREATE OR REPLACE TYPE tp_telefones2_check AS TABLE OF VARCHAR(20);

/

CREATE TABLE ntable (id NUMBER, col1 tp_telefones2_check) 
    NESTED TABLE col1 STORE AS col1_tab;

INSERT INTO ntable VALUES (1, tp_telefones2_check('882020')); 
INSERT INTO ntable VALUES (2, tp_telefones2_check('102030', '203010'));



                                               

--5 (Daniel)

CREATE TYPE tp_check_filmes AS OBJECT (
    name VARCHAR2(30),
    CONSTRUCTOR FUNCTION tp_check_filmes(SELF IN OUT NOCOPY tp_check_filmes, name VARCHAR2)
                               RETURN SELF AS RESULT
) NOT FINAL;
/

CREATE TYPE BODY tp_check_filmes AS
    CONSTRUCTOR FUNCTION tp_check_filmes(SELF IN OUT NOCOPY tp_check_filmes, name VARCHAR2) 
                               RETURN SELF AS RESULT IS
    BEGIN
        SELF.name := name;
        RETURN;
    END;
    
END;
/
create table tb_check_filmes of tp_check_filmes;
insert into tb_check_filmes values (tp_check_filmes('ooi') );
/




--11

alter type tp_cliente add attribute ( CEP NUMERIC (8 , 0)) CASCADE;                                                  
       
/

-- 12 
--modificar propriedade(tamanho) do atributo nome
ALTER TYPE tp_filme modify attribute Nome VARCHAR(50) CASCADE;
                                                   
                                                   
-- 13. (Daniel)
ALTER TYPE tp_Filho DROP ATTRIBUTE Nascimento INVALIDATE;

--14 (Falta)
--15 (Falta)





--16
select Fi.ref_tp_Cliente.CPF
from tb_Filho Fi
where Fi.ref_tp_Cliente is dangling;
/

--17 Botei Um scope is na criação da tabela filho

--18 Script de Criação

--19
select Ing.ref_tp_Assento.Adaptavel
from tb_Ingresso Ing
where Ing.Cliente_id in (select Cl.n_cadastro
					from tb_Cliente Cl
					where Cl.CPF = 1111);
/

--20
select DEREF(Fi.ref_tp_Cliente) as pai 
from tb_Filho Fi;
/

-- 22 e 25. criacao de consulta com TABLE que exibe os dados de um VARRAY
select e.nome || ' ' || e.preco || ' ' as "comida e preco"
from carrinhodecomida2 w, table(w.comidas) e;

-- 23. criacao de consultas com LIKE, BETWEEN, ORDER BY, GROUP BY, HAVING
-- like
select nome from tb_Filme
where nome like 'C%';

-- between
select sexo from tb_funcionario
where salario between 3 and 10;

-- order by
select nome from tb_Filme
order by estreiaData, film_id;

-- group by
select count(id_func), salario from tb_funcionario
where salario > 2
group by salario;

-- having
select fileira from tb_assento
group by fileira
having count(adaptavel) > 1;


-- 24. criacao de subconsultas com IN , ALL, ANY,
-- in
select nome from tb_filme
where film_id in (select film_id from tb_sessao where tresd = '1');

-- all
select nome from tb_filme
where film_id = all(select film_id from tb_sessao where horario > '23:00');

-- any
select nome from tb_filme
where film_id = any (select film_id from tb_sessao where evento = 'Filme');


-- 26
SELECT * FROM ntable; 
-----------------27-----------    




------27-------------
--28
CREATE OR REPLACE TRIGGER novoCliente
BEFORE INSERT OR UPDATE ON tb_Cliente
FOR EACH ROW
BEGIN
   dbms_output.put_line('Novo cliente cadastrado');
END novoCliente;

INSERT INTO Cliente (n_cadastro, CPF,Nascimento) VALUES (6,1655,to_date ('29/07/1982', 'DD/MM/YYYY'));

--29
CREATE OR REPLACE TRIGGER maxSalario
BEFORE INSERT OR UPDATE OR DELETE ON tb_Funcionario
FOR EACH ROW
BEGIN
IF :new.Salario > 1350 THEN
RAISE_APPLICATION_ERROR(-20222,'O teto salarial dos funcionários é de 1350 reais');
END IF;
END maxSalario;

INSERT INTO Funcionario (ID_func, Aniversario, Sexo, Salario) VALUES
(6,to_date ('29/08/2001', 'DD/MM/YYYY'),'F',1400);

--30
CREATE OR REPLACE TRIGGER befInUpDelFilho
BEFORE INSERT OR UPDATE OR DELETE ON tb_Filho
BEGIN
RAISE_APPLICATION_ERROR(-20222,'Não é possível inserir, modificar ou deletar na tabela Filho');
END befInUpDelFilho;

INSERT INTO Filho (n_cadastro_pai,IdFilho,Nascimento,Cadeirinha) VALUES (4,4,to_date('29/10/2006', 'DD/MM/YYYY'),'0');
