
DROP TABLE Client;
DROP TABLE Estudante;
DROP TABLE Comum;
DROP TABLE Filho;
DROP TABLE Assento;
DROP TABLE Filme;
DROP TABLE Sessao;
DROP TABLE Ingresso;
DROP TABLE GeneroFilme;
DROP TABLE Funcionarios;
DROP TABLE CarrinhoDeComida;
DROP TABLE Comida_Carrinho;
DROP TABLE Bebida_Carrinho;
DROP TABLE Trabalha;

--
CREATE TABLE Client(

  n_cadastro INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  CPF INT NOT NULL,
  Nascimento DATE,
  CONSTRAINT PK_Client PRIMARY KEY (n_cadastro)


);

CREATE TABLE Estudante(

  n_cadastro_Estudo INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  UNE INT NOT NULL,
  CONSTRAINT PK_Estudante PRIMARY KEY (n_cadastro_Estudo),
  CONSTRAINT FK_n_Cadastro FOREIGN KEY (n_cadastro_Estudo) REFERENCES Client (n_cadastro)
);

)
CREATE TABLE Comum(

  n_cadastro_Comum INT GENERATED ALWAYS AS IDENTITY(START with 1 INCREMENT by 1),
  CONSTRAINT PK_Comum PRIMARY KEY (n_cadastro_Comum),
  CONSTRAINT FK_Comum FOREIGN KEY (n_cadastro_Comum) REFERENCES Client (n_cadastro)


);

CREATE TABLE Filho(

  n_cadastro_pai INT GENERATED ALWAYS AS IDENTITY(START with 1 INCREMENT by 1),
  IdFilho INT GENERATED ALWAYS AS IDENTITY(START with 1 INCREMENT by 1),
  Nascimento DATE NOT NULL,
  Badeirinha BOOLEAN NOT NULL,
  CONSTRAINT FK_Filho FOREIGN KEY (n_cadastro_pai) REFERENCES Client (n_cadastro),
  CONSTRAINT PK_Filho  PRIMARY KEY (n_cadastro_pai,IdFilho) 
);

CREATE TABLE Assento(
  Fileira VARCHAR(1),
  Numero INT ,
  Limpeza DATE NOT NULL,
  Dbox BOOLEAN NOT NULL,
  Adaptável BOOLEAN NOT NULL,
  CONSTRAINT PK_Assento PRIMARY KEY (Fileira,Numero)

);

CREATE TABLE Sessao(

  Sala INT,
  Horario VARCHAR(5),
  InicioData DATE NOT NULL,
  TresD BOOLEAN NOT NULL,
  Evento VARCHAR(40) NOT NULL,
  Film_ID INT NOT NULL,
  CONSTRAINT FK_Sessao  FOREIGN KEY (Film_ID) REFERENCES Filme(ID),
  CONSTRAINT PK_Sessao PRIMARY KEY (Sala,Horario)
);

CREATE TABLE Filme(
  Nome VARCHAR(40) NOT NULL,
  ID INT GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
  EstreiaData DATE NOT NULL,
  Seq_ID INT UNIQUE,
  CONSTRAINT FK_Filme FOREIGN KEY (Seq_ID) REFERENCES Filme(ID),
  CONSTRAINT PK_Filme PRIMARY KEY (ID),
);

CREATE TABLE Ingresso(


  Assento_Fileira VARCHAR(1),
  Assento_Numero INT,
  Sessao_Horario VARCHAR(5),
  Sessao_Sala INT ,
  Cliente_id INT,
  Preco FLOAT,

  CONSTRAINT FK1_Ingresso FOREIGN KEY (Assento_Fileira,Assento_Numero) REFERENCES Assento(Fileira,Numero),
  CONSTRAINT FK2_Ingresso FOREIGN KEY (Sessao_Horário,Sessao_Sala) REFERENCES Sala(Horario,Sala),
  CONSTRAINT FK3_Ingresso FOREIGN KEY (Cliente_ID) REFERENCES Client(n_cadastro),
  CONSTRAINT PK_Ingresso PRIMARY KEY (Assento_Fileira,Assento_Numero,Sessao_Horario,Sessao_Sala)


);

CREATE TABLE GeneroFilme(

  genero varchar(10),
  ID_filme INT,
  CONSTRAINT FK1_GeneroFilme FOREIGN KEY (ID_filme) REFERENCES Filme(ID),
  CONSTRAINT PK_GeneroFilme PRIMARY KEY (ID_filme,genero)

);


CREATE TABLE Funcionario(
  ID INT,
  Aniversario DATE NOT NULL,
  Sexo VARCHAR(1) NOT NULL
  Salario INT NOT NULL
  CONSTRAINT PK_Funcionario PRIMARY KEY (ID)


);

CREATE TABLE CarrinhoDeComida(

  ID INT GENERATED ALWAYS AS IDENTITY(START with 1 INCREMENT by 1),
  Revisao DATE NOT NULL,
  CONSTRAINT PK_CarrinhoDeComida PRIMARY KEY (ID)

);

CREATE TABLE Comida_Carrinho(

  ID_Carrinho INT,
  comida VARCHAR(10),
  CONSTRAINT PK_Comida_Carrinho PRIMARY KEY (ID_Carrinho,comida),
  CONSTRAINT FK_Comida_Carrinho FOREIGN KEY (ID_Carrinho) REFERENCES CarrinhoDeComida(ID)

);

CREATE TABLE Bebida_Carrinho(

  ID_Carrinho INT,
  bebida VARCHAR(10),
  CONSTRAINT PK_Bebida_Carrinho PRIMARY KEY (ID_Carrinho,bebida),
  CONSTRAINT FK_Bebida_Carrinho FOREIGN KEY (ID_Carrinho) REFERENCES CarrinhoDeComida(ID)

);

CREATE TABLE Trabalha(
  Funcionario_id INT,
  Carrinho_come_id INT,
  Sessao_hor VARCHAR(5),
  Sessao_sala INT,
  Funcao VARCHAR(10),
  CONSTRAINT FK_Trabalha1 FOREIGN KEY (Funcionario_id) REFERENCES Funcionario(ID),
  CONSTRAINT FK_Trabalha2 FOREIGN KEY (Carrinho_come_id) REFERENCES CarrinhoDeComida(ID),
  CONSTRAINT FK_Trabalha3 FOREIGN KEY (Sessao_hor,Sessao_sala) REFERENCES Sessao(Horario,Sala),
  CONSTRAINT PK_Trabalha PRIMARY KEY (Funcionario_id,Carrinho_come_id,Sessao_hor,Sessao_sala,Funcao)
);



