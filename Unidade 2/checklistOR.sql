-- --1., 2., 3., 4.
-- CREATE OR REPLACE TYPE tp_endereco AS VARRAY(2) OF VARCHAR2(30);

-- CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
--     nome VARCHAR2(30),
--     CPF VARCHAR2(11),
--     endr tp_endereco,
--     sexo CHAR(1)
-- ) NOT FINAL;

-- CREATE OR REPLACE TYPE tp_faculdade AS OBJECT(
--     nome VARCHAR2(50),
--     num_cursos NUMBER,
--     idade NUMBER,
--     cidade VARCHAR2(30),
-- );

-- CREATE OR REPLACE TYPE tp_ref_faculdade AS TABLE OF REF tp_faculdade;

-- CREATE OR REPLACE TYPE tp_aluno UNDER tp_pessoa(
--     curso VARCHAR2(30),
--     univ tp_ref_faculdade,
--     ano_entrada NUMBER,
--     periodo_atual NUMBER
-- );

-- -- 3.
 
-- A CHECKLIST É A PARTIR DOS NOSSOS SCRIPTS


--3.
CREATE OR REPLACE TYPE tp_va_email AS VARRAY(3) OF VARCHAR2(40);

--12.
ALTER TYPE tp_Usuario
    MODIFY ATTRIBUTE Email tp_va_email CASCADE;

--4.
CREATE OR REPLACE TYPE tp_nt_titulos AS TABLE OF VARCHAR(30);

--11.
ALTER TYPE tp_Episodios_Serie
    ADD ATTRIBUTE nome_titulo tp_nt_titulos;

--5.
ALTER TYPE tp_Genero
    ADD CONSTRUCTOR FUNCTION tp_Genero(Codigo_Genero NUMBER, Nome VARCHAR2) RETURN SELF AS RESULT CASCADE;

CREATE OR REPLACE TYPE BODY tp_Genero AS    
    CONSTRUCTOR FUNCTION tp_Genero(Codigo_Genero NUMBER, Nome VARCHAR2) RETURN SELF AS RESULT AS
    BEGIN
        SELF.Codigo_Genero := Codigo_Genero;
        SELF.Nome := Nome;
        SELF.Popularidade := 'Ainda não avaliado';
        RETURN;
    END
END

-- 13.
ALTER TYPE tp_Diretor
    DROP ATTRIBUTE Data_Nascimento DATE INVALIDATE;

--14.
ALTER TYPE tp_Titulo
    MODIFY ATTRIBUTE Nome VARCHAR(40) CASCADE;

--15.
ALTER TYPE tp_Titulo
    MODIFY ATTRIBUTE Avaliacao VARCHAR2(10) INVALIDATE;

--16.
SELECT DR.Codigo_Diretor.Nome
FROM tb_Dirige DR
WHERE DR.Codigo_Diretor IS DANGLING

--17.
ALTER TABLE tb_Usuario
    MODIFY ref_Administrador SCOPE IS tb_Usuario;

--18. NÃO ENTENDEMOS

--19.
SELECT AD.Codigo_Titulo.ref_Genero.nome
FROM tb_Adiciona
WHERE AD.Codigo_Titulo = 1

--20.
SELECT DEREF(T.ref_Genero) as GEN
FROM tb_Titulo T

--21.
SELECT VALUE(A) as TITULOS
FROM tb_Assiste A

--22. 25.
SELECT *
FROM TABLE(
    SELECT U.Email
    FROM tb_Usuario U
    WHERE U.Nome = 'João das Neves'
)

--23.
SELECT *
FROM TABLE(
    SELECT ES.nome_titulo
    FROM tb_Episodios_Serie ES
    WHERE U.Codigo_Titulo = 1
)

--6.
ALTER TYPE tp_Usuario
    ADD MEMBER FUNCTION nameToCatital RETURN VARCHAR CASCADE;
    
CREATE OR REPLACE TYPE BODY tp_Usuario AS
    MEMBER FUNCTION nameToCapital RETURN VARCHAR IS
    BEGIN
        RETURN UPPER(SELF.Nome);
    END;
END;
/
DECLARE
    usuarioAdm tp_Usuario;
BEGIN
    SELECT DEREF(ref_Administrador) INTO usuarioAdm
    FROM tb_Usuario
    WHERE Email = 'user1@gmail.com';
    DBMS_OUTPUT.PUT_LINE(usuarioAdm.nameToCapital());
END;

--7 e 9 e 10.
ALTER TYPE tp_Titulo
    ADD MAP MEMBER FUNCTION tituloToInt RETURN NUMBER CASCADE;
    
ALTER TYPE tp_Serie
    ADD OVERRIDING MAP MEMBER FUNCTION tituloToInt RETURN NUMBER CASCADE;
CREATE OR REPLACE TYPE BODY AS
    OVERRIDING MAP MEMBER FUNCTION tituloToInt RETURN NUMBER IS
    BEGIN
        RETURN Qtd_Temporadas;
    END;
END;
/
BEGIN
    SELECT R.ref_Serie.Nome
    FROM tb_Episodios_Serie R
    ORDER BY DEREF(R.ref_Serie);
END;

--8.
ALTER TYPE tp_Usuario
    ADD ORDER MEMBER FUNCTION isOlderThan (otherUser tp_Usuario) RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY AS
    ORDER MEMBER FUNCTION comp (otherUser tp_Usuario) RETURN NUMBER IS
    BEGIN
        RETURN otherUser.Data_Nascimento - SELF.Data_Nascimento;
    END;
END;

DECLARE
    userTest := tp_Usuario('usertest@gmail.com', to_date ('23/08/1971', 'dd/mm/yyyy'), 'Eduardo Fraco', (SELECT REF(U) FROM tb_Usuario U WHERE U.Email = 'user1@gmail.com'), (SELECT REF(C) FROM tb_Cartao_Credito C WHERE C.Numero = 6662));
    userTest2 := tp_Usuario('usertest2@gmail.com', to_date ('23/08/1973', 'dd/mm/yyyy'), 'Eduardo Corno', (SELECT REF(U) FROM tb_Usuario U WHERE U.Email = 'user1@gmail.com'), (SELECT REF(C) FROM tb_Cartao_Credito C WHERE C.Numero = 6662));
BEGIN
    IF userTest.isOlderThan(userTest2) > 0 THEN
        DBMS_OUTPUT.PUT_LINE('É mais velho');
    ELSEIF userTest.isOlderThan(userTest2) < 0 THEN
        DBMS_OUTPUT.PUT_LINE('É mais novo');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Os dois têm a mesma idade');
    END IF

END;

--23.
SELECT S.Nome
FROM tb_Serie S
ORDER BY S.Qtd_Temporadas;

SELECT S.Nome
FROM tb_Serie S
GROUP BY S.Classificacao;

-- Série com mais de 5 episódios
SELECT S.ref_Serie.Nome
FROM tb_Episodios_Serie
GROUP BY S.ref_Serie
HAVING COUNT (S.ref_Serie) > 5;

SELECT U.Nome
FROM tb_Usuario U
WHERE U.Nome LIKE 'Ed%';

SELECT U.Nome
From tb_Usuario U
WHERE U.Data_Nascimento BETWEEN to_date ('23/08/1990', 'dd/mm/yyyy') AND to_date ('23/08/2000', 'dd/mm/yyyy');

--24.
SELECT S.Nome
FROM tb_Serie
WHERE S.Qtd_Temporadas IN (1, 2, 3, 4, 5);

SELECT S.Nome
FROM tb_Serie
WHERE S.Qtd_Temporadas = ALL (6, 8, 10, 20);

SELECT S.Nome
FROM tb_Serie
WHERE S.Qtd_Temporadas = ANY (6, 8, 10, 20);

--27.
SELECT *
FROM tb_Diretor D
WHERE EXISTS (
    SELECT *
    FROM tb_Premio P
    WHERE P.ref_Diretor = D.Codigo_Diretor;
);
