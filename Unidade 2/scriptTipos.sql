DROP TYPE tp_Premio;
DROP TYPE tp_Dirige;
DROP TYPE tp_Assiste;
DROP TYPE tp_Adiciona;
DROP TYPE tp_Episodios;
DROP TYPE tp_Filme;
DROP TYPE tp_Serie;
DROP TYPE tp_Usuario;
DROP TYPE tp_Cartao_Credito;
DROP TYPE tp_Lista;
DROP TYPE tp_Estudio;
DROP TYPE tp_Titulo;
DROP TYPE tp_Diretor;
DROP TYPE tp_Genero;

CREATE OR REPLACE TYPE tp_Genero AS OBJECT (
	Codigo_Genero INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	Nome VARCHAR2(50),
	Popularidade VARCHAR(50)
) FINAL;

CREATE OR REPLACE TYPE tp_Diretor AS OBJECT (
	Codigo_Diretor INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	Nome VARCHAR2(50),
	Data_Nascimento DATE
) FINAL;

CREATE OR REPLACE TYPE tp_Titulo AS OBJECT (
	Codigo_Titulo INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    Data DATE,
    Nome VARCHAR(50),
    Classificacao VARCHAR(50),
    Avaliacao NUMBER,
    ref_Genero REF tp_Genero;
    ref_Diretor REF tp_Diretor;
) NOT FINAL NOT INSTANTIABLE;

CREATE OR REPLACE TYPE tp_Estudio AS OBJECT (
	Codigo_Estudio INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    Local VARCHAR(50),
    Nome VARCHAR(50),
    Data_Lancamento DATE,
    ref_Titulo REF tp_Titulo
) FINAL;

CREATE OR REPLACE TYPE tp_Lista AS OBJECT (
    Codigo_Lista INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    Data_Atualizacao DATE,
    Nome VARCHAR(50)
) FINAL;

CREATE OR REPLACE TYPE tp_Cartao_Credito AS OBJECT (
    Numero NUMBER,
    Codigo_Seguranca NUMBER,
    Bandeira VARCHAR(10)
) FINAL;

CREATE OR REPLACE TYPE tp_Usuario AS OBJECT (
    Email VARCHAR(40) NOT NULL,
    Data_Nascimento DATE,
    Nome VARCHAR(50),
    ref_Cartao REF tp_Cartao_Credito,
    ref_Administrador REF tp_Usuario -- auto-relacionamento
) FINAL;

CREATE OR REPLACE TYPE tp_Serie under tp_Titulo ( -- herança
    Qtd_Temporadas NUMBER
) FINAL;

CREATE OR REPLACE TYPE tp_Filme under tp_Titulo ( -- herança
    Duracao NUMBER
) FINAL;

CREATE OR REPLACE TYPE tp_Episodios AS OBJECT (
    Nome VARCHAR(50),
    Numero_Episodio NUMBER,
    Duracao NUMBER
) FINAL;

CREATE OR REPLACE TYPE tp_Adiciona AS OBJECT(
	Email VARCHAR(40),
    Codigo_Lista NUMBER,
    Codigo_Titulo NUMBER,
	ref_Lista REF tp_Lista,
	ref_Titulo REF tp_Titulo
) FINAL;

CREATE OR REPLACE TYPE tp_Assiste AS OBJECT(
	Email VARCHAR(40),
    Codigo_Titulo NUMBER,
	ref_Titulo REF tp_Titulo
) FINAL;

CREATE OR REPLACE TYPE tp_Dirige AS OBJECT(
    Nome VARCHAR(50) ,
    Categoria_Premiacao VARCHAR(40),
    Ano DATE,
	Codigo_Titulo INT,
    Codigo_Diretor INT,
    ref_Titulo REF tp_Titulo,
    ref_Diretor REF tp_Diretor
) FINAL;