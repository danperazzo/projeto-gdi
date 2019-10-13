

--1
CREATE TABLE Cliente(

  n_cadastro INT,
  CPF INT NOT NULL,
  Nascimento DATE,
  CONSTRAINT PK_Cliente PRIMARY KEY (n_cadastro)


);

--2

CREATE TABLE Estudante(

  n_cadastro_Estudo INT,
  UNE INT NOT NULL,
  CONSTRAINT PK_Estudante PRIMARY KEY (n_cadastro_Estudo),
  CONSTRAINT FK_n_Cadastro FOREIGN KEY (n_cadastro_Estudo) REFERENCES Cliente (n_cadastro)
);

--3
CREATE TABLE Comum(

  n_cadastro_Comum INT,
  CONSTRAINT PK_Comum PRIMARY KEY (n_cadastro_Comum),
  CONSTRAINT FK_Comum FOREIGN KEY (n_cadastro_Comum) REFERENCES Cliente (n_cadastro)


);

--4

CREATE TABLE Filho(

  n_cadastro_pai INT,
  IdFilho INT,
  Nascimento DATE NOT NULL,
  Cadeirinha VARCHAR(1) NOT NULL,
  CONSTRAINT FK_Filho FOREIGN KEY (n_cadastro_pai) REFERENCES Cliente (n_cadastro),
  CONSTRAINT PK_Filho  PRIMARY KEY (n_cadastro_pai,IdFilho) 
);

--5
CREATE TABLE Assento(
  Fileira VARCHAR(1),
  Numero VARCHAR(1),
  Limpeza DATE NOT NULL,
  Dbox VARCHAR(1) NOT NULL,
  Adaptavel VARCHAR(1) NOT NULL,
  CONSTRAINT PK_Assento PRIMARY KEY (Fileira,Numero)

);

--6

CREATE TABLE Filme(
  Nome VARCHAR(40) NOT NULL,
  Film_ID INT,
  EstreiaData DATE NOT NULL,
  Seq_ID INT UNIQUE,
  CONSTRAINT PK_Filme PRIMARY KEY (Film_ID),
  CONSTRAINT FK_Filme FOREIGN KEY (Seq_ID) REFERENCES Filme(Film_ID)
  
);


--7
CREATE TABLE Sessao(

  Sala VARCHAR(5),
  Horario VARCHAR(5),
  InicioData DATE NOT NULL,
  TresD VARCHAR(1) NOT NULL,
  Evento VARCHAR(40) NOT NULL,
  Film_ID INT NOT NULL,
  CONSTRAINT FK_Sessao  FOREIGN KEY (Film_ID) REFERENCES Filme(Film_ID),
  CONSTRAINT PK_Sessao PRIMARY KEY (Sala,Horario)
);


--8
CREATE TABLE Ingresso(


  Assento_Fileira VARCHAR(1),
  Assento_Numero VARCHAR(1),
  Sessao_Horario VARCHAR(5),
  Sessao_Sala VARCHAR(5),
  Cliente_id INT,
  Preco FLOAT,
  Desconto INT,

  CONSTRAINT FK1_Ingresso FOREIGN KEY (Assento_Fileira,Assento_Numero) REFERENCES Assento(Fileira,Numero),
  CONSTRAINT FK3_Ingresso FOREIGN KEY (Cliente_ID) REFERENCES Cliente(n_cadastro),
  CONSTRAINT PK_Ingresso PRIMARY KEY (Assento_Fileira,Assento_Numero,Sessao_Horario,Sessao_Sala)

);


--9
CREATE TABLE GeneroFilme(

  genero varchar(10),
  ID_filme INT,
  CONSTRAINT FK1_GeneroFilme FOREIGN KEY (ID_filme) REFERENCES Filme(Film_ID),
  CONSTRAINT PK_GeneroFilme PRIMARY KEY (ID_filme,genero)

);

--10
CREATE TABLE Funcionario(
  ID_func INT,
  Aniversario DATE NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Salario INT NOT NULL,
  CONSTRAINT PK_Funcionario PRIMARY KEY (ID_func)


);


--11
CREATE TABLE CarrinhoDeComida(

  ID_car INT,
  Revisao DATE NOT NULL,
  CONSTRAINT PK_CarrinhoDeComida PRIMARY KEY (ID_car)

);


--13
CREATE TABLE Comida_Carrinho(

  ID_Carrinho INT,
  comida VARCHAR(10),
  CONSTRAINT PK_Comida_Carrinho PRIMARY KEY (ID_Carrinho,comida),
  CONSTRAINT FK_Comida_Carrinho FOREIGN KEY (ID_Carrinho) REFERENCES CarrinhoDeComida(ID_car)

);


--14
CREATE TABLE Bebida_Carrinho(

  ID_Carrinho INT,
  bebida VARCHAR(10),
  CONSTRAINT PK_Bebida_Carrinho PRIMARY KEY (ID_Carrinho,bebida),
  CONSTRAINT FK_Bebida_Carrinho FOREIGN KEY (ID_Carrinho) REFERENCES CarrinhoDeComida(ID_car)

);


--15
CREATE TABLE Trabalha(
  Funcionario_id INT,
  Carrinho_come_id INT,
  Sessao_hor VARCHAR(5),
  Sessao_sala VARCHAR(5),
  Funcao VARCHAR(10),
  CONSTRAINT FK_Trabalha1 FOREIGN KEY (Funcionario_id) REFERENCES Funcionario(ID_func),
  CONSTRAINT FK_Trabalha2 FOREIGN KEY (Carrinho_come_id) REFERENCES CarrinhoDeComida(ID_car),
  CONSTRAINT FK_Trabalha3 FOREIGN KEY (Sessao_hor,Sessao_sala) REFERENCES Sessao(Horario,Sala),
  CONSTRAINT PK_Trabalha PRIMARY KEY (Funcionario_id,Carrinho_come_id,Sessao_hor,Sessao_sala,Funcao)
);



