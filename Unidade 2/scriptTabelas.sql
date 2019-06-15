DROP TABLE tp_Premio;
DROP TABLE tp_Dirige;
DROP TABLE tp_Assiste;
DROP TABLE tp_Adiciona;
DROP TABLE tp_Episodios;
DROP TABLE tp_Filme;
DROP TABLE tp_Serie;
DROP TABLE tp_Usuario;
DROP TABLE tp_Cartao_Credito;
DROP TABLE tp_Lista;
DROP TABLE tp_Estudio;
DROP TABLE tp_Titulo;
DROP TABLE tp_Diretor;
DROP TABLE tp_Genero;

CREATE TABLE tb_Genero OF tp_Genero (
	PRIMARY KEY (Codigo_Genero),
	Nome NOT NULL,
	Popularidade NOT NULL
);

CREATE TABLE tb_Diretor OF tp_Diretor (
	PRIMARY KEY (Codigo_Diretor),
	Nome NOT NULL,
	Data_Nascimento NOT NULL
);

CREATE TABLE tb_Titulo OF tp_Titulo ( -- conferir
	PRIMARY KEY (Codigo_Titulo),
    FOREIGN KEY (Codigo_Genero) REFERENCES tb_Genero,
    FOREIGN KEY (Codigo_Diretor) REFERENCES tb_Diretor,
	Data NOT NULL,
    Nome NOT NULL,
    Classificacao NOT NULL,
    Avaliacao NOT NULL
);

CREATE TABLE tb_Estudio OF tp_Estudio ( -- conferir
	PRIMARY KEY (Codigo_Estudio),
    FOREIGN KEY (Codigo_Titulo) REFERENCES tb_Titulo,
    Local NOT NULL,
    NOME NOT NULL,
    Data_Lancamento NOT NULL
);

CREATE TABLE tb_Lista OF tp_Lista (
    PRIMARY KEY (Codigo_Lista),
    Data_Atualizacao NOT NULL,
    Nome NOT NULL   
);

CREATE TABLE tb_Cartao_Credito OF tp_Cartao_Credito (
    PRIMARY KEY (Numero),
    Codigo_Seguranca NOT NULL,
    Bandeira NOT NULL   
);

CREATE TABLE tb_Usuario OF tp_Usuario ( -- conferir
    PRIMARY KEY (Email),
    FOREIGN KEY (Numero) REFERENCES tb_Cartao_Credito,
    FOREIGN KEY (Email) REFERENCES tb_Usuario,
    Data_Nascimento NOT NULL,
    Nome NOT NULL
);

CREATE TABLE tb_Serie OF tp_Serie (
    PRIMARY KEY (Codigo_Titulo),
    Qtd_Temporadas NOT NULL
);

CREATE TABLE tb_Filme OF tp_Filme (
    PRIMARY KEY (Codigo_Titulo),
    Duracao NOT NULL
);

CREATE TABLE tb_Episodios_Serie OF tp_Episodios_Serie (
    -- me perdi no que eu tava fazendo
);