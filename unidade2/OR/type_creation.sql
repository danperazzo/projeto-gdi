DROP TYPE tp_Cliente force;
DROP TYPE tp_Estudante force;
DROP TYPE tp_Comum force;
DROP TYPE tp_Filho force;
DROP TYPE tp_Assento force;
DROP TYPE tp_Filme force;
DROP TYPE tp_Sessao force;
DROP TYPE tp_Ingresso force;
DROP TYPE tp_GeneroFilme force;
DROP TYPE tp_Funcionario force;
DROP TYPE tp_CarrinhoDeComida force;
DROP TYPE tp_Comida_Carrinho force;
DROP TYPE tp_Bebida_Carrinho force;
DROP TYPE tp_Trabalha force;

CREATE OR REPLACE TYPE tp_Cliente AS OBJECT (
	n_cadastro NUMBER,
	CPF NUMBER,
	Nascimento DATE
) NOT FINAL;
/
-- T

CREATE OR REPLACE TYPE tp_Estudante under tp_Cliente (
	UNE INT
) NOT FINAL;
/
-- T

CREATE OR REPLACE TYPE tp_Comum under tp_Cliente(


)NOT FINAL;
/
-- T

CREATE OR REPLACE TYPE tp_Filho AS OBJECT(
    n_cadastro_pai NUMBER,
    IdFilho NUMBER,
    Nascimento DATE,
    Cadeirinha VARCHAR(1),
    ref_tp_Cliente REF tp_Cliente
)NOT FINAL;
/
-- T


CREATE OR REPLACE TYPE tp_Assento AS OBJECT(
    Fileira VARCHAR(1),
    Numero VARCHAR(1),
    Limpeza DATE,
    Dbox VARCHAR(1),
    Adaptavel VARCHAR(1)
)NOT FINAL;
/

-- T


CREATE OR REPLACE TYPE tp_Filme AS OBJECT(
    Nome VARCHAR(40),
    Film_ID INT,
    EstreiaData DATE,
    Seq_ID INT,
    ref_tp_Filme  REF tp_Filme
)NOT FINAL;
/


-- T

CREATE OR REPLACE TYPE tp_Sessao AS OBJECT(
    Sala VARCHAR(5),
    Horario VARCHAR(5),
    InicioData DATE ,
    TresD VARCHAR(1),
    Evento VARCHAR(40),
    Film_ID INT,ref_tp_Filme REF tp_Filme
    )NOT FINAL;
/



-- T

CREATE OR REPLACE TYPE tp_Ingresso AS OBJECT(
    Assento_Fileira VARCHAR(1),
    Assento_Numero VARCHAR(1),
    Sessao_Horario VARCHAR(5),
    Sessao_Sala VARCHAR(5),
    Cliente_id INT,
    Preco FLOAT,
    Desconto INT,
    ref_tp_Assento REF tp_Assento,
    ref_tp_Cliente REF tp_Cliente
    )NOT FINAL;
    
/

-- T

CREATE OR REPLACE TYPE tp_GeneroFilme AS OBJECT(
    genero varchar(10),
    ID_filme INT,
    ref_tp_Filme REF tp_Filme
    )NOT FINAL;
    
/

-- T

CREATE OR REPLACE TYPE tp_Funcionario AS OBJECT(
    ID_func INT,
    Aniversario DATE,
    Sexo VARCHAR(1),
    Salario INT
    )NOT FINAL;
    
/

-- T

CREATE OR REPLACE TYPE tp_CarrinhoDeComida AS OBJECT(
    ID_car INT,
    Revisao DATE
    )NOT FINAL;
    
/

-- T

CREATE OR REPLACE TYPE tp_Comida_Carrinho AS OBJECT(
    ID_Carrinho INT,
    comida VARCHAR(10),
    ref_tp_CarrinhoDeComida REF tp_CarrinhoDeComida
    )NOT FINAL;
    
/

-- T

CREATE OR REPLACE TYPE tp_Bebida_Carrinho AS OBJECT(
    ID_Carrinho INT,
    bebida VARCHAR(10),
    ref_tp_CarrinhoDeComida REF tp_CarrinhoDeComida
    )NOT FINAL;
/

-- T

CREATE OR REPLACE TYPE tp_Trabalha AS OBJECT(
    Funcionario_id INT,
    Carrinho_come_id INT,
    Sessao_hor VARCHAR(5),
    Sessao_sala VARCHAR(5),
    Funcao VARCHAR(10),
    ref_tp_Funcionario REF tp_Funcionario,
    ref_CarrinhoDeComida REF tp_CarrinhoDeComida,
    ref_tp_Sessao REF tp_Sessao
    )NOT FINAL;
/

create or replace type Comida as object(preco number(10), nome varchar2(10));
/
create or replace type Comidas as varray(3) of Comida;
/