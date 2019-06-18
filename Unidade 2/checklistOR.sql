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


--3 e 12.
CREATE OR REPLACE TYPE tp_va_email AS VARRAY(3) OF VARCHAR2(40);

ALTER TYPE tp_Usuario
    MODIFY ATTRIBUTE Email tp_va_email CASCADE;

--4 e 11.
CREATE OR REPLACE TYPE tp_nt_titulos AS TABLE OF VARCHAR(30);

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







