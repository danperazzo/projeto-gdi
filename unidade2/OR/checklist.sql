--CHECKLIST

--1
CREATE OR REPLACE TYPE tp_Filho AS OBJECT(
    n_cadastro_pai NUMBER,
    IdFilho NUMBER,
    Nascimento DATE,
    Cadeirinha VARCHAR(1),
    ref_tp_Cliente REF tp_Cliente
)NOT FINAL;
/
--2

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
    comida tp_Comida_Carrinho,
    bebida  tp_Bebida_Carrinho
    )NOT FINAL;
/

--3 

CREATE OR REPLACE TYPE tp_telefones_check AS VARRAY(10) OF VARCHAR2(15);

/

--4

CREATE OR REPLACE TYPE tp_telefones2_check AS TABLE OF VARCHAR(20); -- 4
    

