
DROP TABLE Premio;
DROP TABLE Dirige;
DROP TABLE Assiste;
DROP TABLE Adiciona;
DROP TABLE Episodios;
DROP TABLE Filme;
DROP TABLE Serie;
DROP TABLE Usuario;
DROP TABLE Cartao_Credito;
DROP TABLE Lista;
DROP TABLE Estudio;
DROP TABLE Titulo;
DROP TABLE Diretor;
DROP TABLE Genero;


CREATE TABLE Genero (
  Codigo_Genero INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR2 (50),
  Popularidade VARCHAR (50),
  CONSTRAINT Genero_pk PRIMARY KEY (Codigo_Genero)
);

CREATE TABLE Diretor (
  Codigo_Diretor INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR (50),
  Nacionalidade VARCHAR (50),
  Data_Nascimento DATE,
  CONSTRAINT Diretor_pk PRIMARY KEY (Codigo_Diretor)
);

CREATE TABLE Titulo (
  Codigo_Titulo INT NOT NULL AUTO_INCREMENT,
  Data DATE,
  Nome VARCHAR(50),
  Classificacao VARCHAR(50),
  Avaliacao NUMBER,
  Codigo_Genero NUMBER,
  Codigo_Diretor NUMBER UNIQUE,
  CONSTRAINT Titulo_pk PRIMARY KEY (Codigo_Titulo),
  CONSTRAINT Titulo_fk FOREIGN KEY (Codigo_Genero) REFERENCES Genero (Codigo_Genero),
  CONSTRAINT Titulo_fk2 FOREIGN KEY (Codigo_Diretor) REFERENCES Diretor (Codigo_Diretor)
);

CREATE TABLE Estudio (
  Codigo_Estudio INT NOT NULL AUTO_INCREMENT,
  Local VARCHAR(50),
  Nome VARCHAR(50),
  Data_Lancamento DATE,
  Codigo_Titulo NUMBER UNIQUE,
  CONSTRAINT Estudio_pk PRIMARY KEY (Codigo_Estudio),
  CONSTRAINT Estudio_fk FOREIGN KEY (Codigo_Titulo) REFERENCES Titulo (Codigo_Titulo)
);

CREATE TABLE Lista (
  Codigo_Lista INT NOT NULL AUTO_INCREMENT,
  Data_Atualizacao DATE,
  Nome VARCHAR(50),
  CONSTRAINT Lista_pk PRIMARY KEY (Codigo_Lista)
);

CREATE TABLE Cartao_Credito (
  Numero NUMBER,
  Codigo_Seguranca NUMBER,
  Bandeira VARCHAR(10),
  CONSTRAINT Cartao_Credito_pk PRIMARY KEY (Numero)
);

CREATE TABLE Usuario (
  Email VARCHAR(40) NOT NULL,
  Data_Nascimento DATE,
  Nome VARCHAR(50),
  Email_Administrador VARCHAR(40),
  Numero NUMBER,
  CONSTRAINT Usuario_pk PRIMARY KEY (Email),
  CONSTRAINT Usuario_fk FOREIGN KEY (Email_Administrador) REFERENCES Usuario (Email),
  CONSTRAINT Usuario_fk2 FOREIGN KEY (Numero) REFERENCES Cartao_Credito (Numero)
);

CREATE TABLE Serie (
  Codigo_Titulo INT NOT NULL,
  Qtd_Temporadas NUMBER,
  CONSTRAINT Serie_pk PRIMARY KEY (Codigo_Titulo),
  CONSTRAINT Serie_fk FOREIGN KEY (Codigo_Titulo) REFERENCES Titulo (Codigo_Titulo)
);

CREATE TABLE Filme (
  Codigo_Titulo INT NOT NULL,
  Duracao NUMBER,
  CONSTRAINT Filme_pk PRIMARY KEY (Codigo_Titulo),
  CONSTRAINT Filme_fk FOREIGN KEY (Codigo_Titulo) REFERENCES Titulo (Codigo_Titulo)
);

CREATE TABLE Episodios (
  Codigo_Titulo INT NOT NULL,
  Numero_Episodio NUMBER,
  Duracao NUMBER,
  Nome VARCHAR(50),
  CONSTRAINT Episodios_pk PRIMARY KEY (Codigo_Titulo, Numero_Episodio),
  CONSTRAINT Episodios_fk FOREIGN KEY (Codigo_Titulo) REFERENCES Titulo (Codigo_Titulo)
);

CREATE TABLE Adiciona (
  Email VARCHAR(40) NOT NULL,
  Codigo_Lista NUMBER,
  Codigo_Titulo NUMBER,
  CONSTRAINT Adiciona_pk PRIMARY KEY (Email, Codigo_Lista, Codigo_Titulo),
  CONSTRAINT Adiciona_fk FOREIGN KEY (Codigo_Lista) REFERENCES Lista (Codigo_Lista),
  CONSTRAINT Adiciona_fk2 FOREIGN KEY (Codigo_Titulo) REFERENCES Titulo (Codigo_Titulo)
);

CREATE TABLE Assiste (
  Email VARCHAR(40) NOT NULL,
  Codigo_Titulo NUMBER,
  Data DATE NOT NULL,
  CONSTRAINT Assiste_pk PRIMARY KEY (Email, Codigo_Titulo),
  CONSTRAINT Assiste_fk FOREIGN KEY (Codigo_Titulo) REFERENCES Titulo (Codigo_Titulo)
);

CREATE TABLE Dirige (
  Codigo_Titulo INT NOT NULL,
  Codigo_Diretor INT NOT NULL,
  Nome VARCHAR(50) ,
  Categoria_Premiacao VARCHAR(40),
  Ano DATE,
  CONSTRAINT Dirige_pk PRIMARY KEY (Codigo_Titulo, Codigo_Diretor),
  CONSTRAINT Dirige_fk FOREIGN KEY (Codigo_Titulo) REFERENCES Titulo (Codigo_Titulo),
  CONSTRAINT Dirige_fk2 FOREIGN KEY (Codigo_Diretor) REFERENCES Diretor (Codigo_Diretor)
);

CREATE TABLE Premio (
  Categoria VARCHAR(50) NOT NULL,
  Codigo_Titulo NUMBER NOT NULL,
  Codigo_Diretor NUMBER NOT NULL,
  Nome VARCHAR(50),
  Valor NUMBER,
  CONSTRAINT Premio_pk PRIMARY KEY (Categoria, Codigo_Titulo, Codigo_Diretor),
  CONSTRAINT Premio_fk FOREIGN KEY (Codigo_Titulo) REFERENCES Titulo (Codigo_Titulo),
  CONSTRAINT Premio_fk2 FOREIGN KEY (Codigo_Diretor) REFERENCES Diretor (Codigo_Diretor)
);
