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
