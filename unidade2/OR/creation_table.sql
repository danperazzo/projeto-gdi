

--1
DROP TABLE tb_Cliente;

--2

DROP TABLE tb_Estudante;

--3
DROP TABLE tb_Comum;

--4

DROP TABLE tb_Filho;

--5
DROP TABLE tb_Assento;

--6

DROP TABLE tb_Filme;


--7
DROP TABLE tb_Sessao;


--8
DROP TABLE tb_Ingresso;


--9
DROP TABLE tb_GeneroFilme;

--10
DROP TABLE tb_Funcionario;


--11
DROP TABLE tb_CarrinhoDeComida;


--13
DROP TABLE tb_Comida_Carrinho;


--14
DROP TABLE tb_Bebida_Carrinho;


--15
DROP TABLE tb_Trabalha;








--1
CREATE TABLE tb_Cliente OF tp_Cliente(

    PRIMARY KEY (n_cadastro)


);

--2

CREATE TABLE tb_Estudante OF tp_Estudante(

  PRIMARY KEY (n_cadastro)
);

--3
CREATE TABLE tb_Comum OF tp_Comum(

  PRIMARY KEY (n_cadastro)



);

--4

CREATE TABLE tb_Filho of tp_Filho(


  PRIMARY KEY (n_cadastro_pai,IdFilho),
  ref_tp_Cliente scope is tb_Cliente
);

--5
CREATE TABLE tb_Assento of tp_Assento(
  PRIMARY KEY (Fileira,Numero)

);

--6

CREATE TABLE tb_Filme of tp_Filme(

  PRIMARY KEY (Film_ID),
  FOREIGN KEY (ref_tp_Filme) REFERENCES tb_Filme
  
);


--7
CREATE TABLE tb_Sessao of tp_Sessao(

  FOREIGN KEY (ref_tp_Filme) REFERENCES tb_Filme,
  PRIMARY KEY (Sala,Horario)
);


--8
CREATE TABLE tb_Ingresso of tp_Ingresso(


  FOREIGN KEY (Assento_Fileira,Assento_Numero) REFERENCES tb_Assento,
  FOREIGN KEY (ref_tp_Cliente) REFERENCES tb_Cliente,
  PRIMARY KEY (Assento_Fileira,Assento_Numero,Sessao_Horario,Sessao_Sala)

);


--9
CREATE TABLE tb_GeneroFilme of tp_GeneroFilme(


  FOREIGN KEY (ref_tp_Filme) REFERENCES tb_Filme,
  PRIMARY KEY (ID_filme,genero)

);

--10
CREATE TABLE tb_Funcionario of tp_Funcionario(

  PRIMARY KEY (ID_func)


);


--11
CREATE TABLE tb_CarrinhoDeComida of tp_CarrinhoDeComida(


  PRIMARY KEY (ID_car)

);


--13
CREATE TABLE tb_Comida_Carrinho of tp_Comida_Carrinho(


  PRIMARY KEY (ID_Carrinho,comida),
  FOREIGN KEY (ref_tp_CarrinhoDeComida) REFERENCES tb_CarrinhoDeComida

);


--14
CREATE TABLE tb_Bebida_Carrinho of tp_Bebida_Carrinho(

  PRIMARY KEY (ID_Carrinho,bebida),
  FOREIGN KEY (ref_tp_CarrinhoDeComida) REFERENCES tb_CarrinhoDeComida

);


--15
CREATE TABLE tb_Trabalha of tp_Trabalha(

  FOREIGN KEY (ref_tp_Funcionario) REFERENCES tb_Funcionario,
  FOREIGN KEY (ref_CarrinhoDeComida) REFERENCES tb_CarrinhoDeComida,
  FOREIGN KEY (ref_tp_Sessao) REFERENCES tb_Sessao,
  PRIMARY KEY (Funcionario_id,Carrinho_come_id,Sessao_hor,Sessao_sala,Funcao)
);


create table CarrinhoDeComida2(carrinhoID number(5), comidas Comidas);
/
