INSERT INTO Cliente (n_cadastro, CPF, Nascimento PK_Cliente) Values();
INSERT INTO Cliente (n_cadastro, CPF, Nascimento PK_Cliente) Values();
INSERT INTO Cliente (n_cadastro, CPF, Nascimento PK_Cliente) Values();
INSERT INTO Cliente (n_cadastro, CPF, Nascimento PK_Cliente) Values();
INSERT INTO Cliente (n_cadastro, CPF, Nascimento PK_Cliente) Values();

INSERT INTO Estudante (n_cadastro_Estudo, UNE, PK_Estudante FK_n_Cadastro) Values();
INSERT INTO Estudante (n_cadastro_Estudo, UNE, PK_Estudante FK_n_Cadastro) Values();
INSERT INTO Estudante (n_cadastro_Estudo, UNE, PK_Estudante FK_n_Cadastro) Values();
INSERT INTO Estudante (n_cadastro_Estudo, UNE, PK_Estudante FK_n_Cadastro) Values();

INSERT INTO Comum (n_cadastro_Comum, PK_Comum FK_Comum) Values();
INSERT INTO Comum (n_cadastro_Comum, PK_Comum FK_Comum) Values();
INSERT INTO Comum (n_cadastro_Comum, PK_Comum FK_Comum) Values();
INSERT INTO Comum (n_cadastro_Comum, PK_Comum FK_Comum) Values();

INSERT INTO Filho (n_cadastro_pai, IdFilho, Nascimento, Cadeirinha, FK_Filho PK_Filho) Values();
INSERT INTO Filho (n_cadastro_pai, IdFilho, Nascimento, Cadeirinha, FK_Filho PK_Filho) Values();

INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();
INSERT INTO Assento (Fileira, Numero, Limpeza, Dbox, Adaptavel PK_Assento) Values();

INSERT INTO Filme (Nome, Film_ID, EstreiaData, Seq_ID, PK_Filme FK_Filme) Values();
INSERT INTO Filme (Nome, Film_ID, EstreiaData, Seq_ID, PK_Filme FK_Filme) Values();
INSERT INTO Filme (Nome, Film_ID, EstreiaData, Seq_ID, PK_Filme FK_Filme) Values();
INSERT INTO Filme (Nome, Film_ID, EstreiaData, Seq_ID, PK_Filme FK_Filme) Values();
INSERT INTO Filme (Nome, Film_ID, EstreiaData, Seq_ID, PK_Filme FK_Filme) Values();

INSERT INTO Sessao (Sala, Horario, InicioData, TresD, Evento, Film_ID, FK_Sessao PK_Sessao) Values();
INSERT INTO Sessao (Sala, Horario, InicioData, TresD, Evento, Film_ID, FK_Sessao PK_Sessao) Values();
INSERT INTO Sessao (Sala, Horario, InicioData, TresD, Evento, Film_ID, FK_Sessao PK_Sessao) Values();

INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();
INSERT INTO Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco, FK1_Ingresso, FK3_Ingresso PK_Ingresso) Values();

INSERT INTO GeneroFilme (genero, ID_filme, FK1_GeneroFilme PK_GeneroFilme) Values();
INSERT INTO GeneroFilme (genero, ID_filme, FK1_GeneroFilme PK_GeneroFilme) Values();
INSERT INTO GeneroFilme (genero, ID_filme, FK1_GeneroFilme PK_GeneroFilme) Values();
INSERT INTO GeneroFilme (genero, ID_filme, FK1_GeneroFilme PK_GeneroFilme) Values();

INSERT INTO Funcionario (ID_func, Aniversario, Sexo, Salario PK_Funcionario) Values();
INSERT INTO Funcionario (ID_func, Aniversario, Sexo, Salario PK_Funcionario) Values();
INSERT INTO Funcionario (ID_func, Aniversario, Sexo, Salario PK_Funcionario) Values();

INSERT INTO CarrinhoDeComida (ID_car, Revisao PK_CarrinhoDeComida) Values();
INSERT INTO CarrinhoDeComida (ID_car, Revisao PK_CarrinhoDeComida) Values();
INSERT INTO CarrinhoDeComida (ID_car, Revisao PK_CarrinhoDeComida) Values();

INSERT INTO Comida_Carrinho (ID_Carrinho, comida, PK_Comida_Carrinho FK_Comida_Carrinho) Values();
INSERT INTO Comida_Carrinho (ID_Carrinho, comida, PK_Comida_Carrinho FK_Comida_Carrinho) Values();
INSERT INTO Comida_Carrinho (ID_Carrinho, comida, PK_Comida_Carrinho FK_Comida_Carrinho) Values();

INSERT INTO Bebida_Carrinho (ID_Carrinho, bebida, PK_Bebida_Carrinho FK_Bebida_Carrinho) Values();
INSERT INTO Bebida_Carrinho (ID_Carrinho, bebida, PK_Bebida_Carrinho FK_Bebida_Carrinho) Values();
INSERT INTO Bebida_Carrinho (ID_Carrinho, bebida, PK_Bebida_Carrinho FK_Bebida_Carrinho) Values();
INSERT INTO Bebida_Carrinho (ID_Carrinho, bebida, PK_Bebida_Carrinho FK_Bebida_Carrinho) Values();
INSERT INTO Bebida_Carrinho (ID_Carrinho, bebida, PK_Bebida_Carrinho FK_Bebida_Carrinho) Values();

INSERT INTO Trabalha (Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao, FK_Trabalha1, FK_Trabalha2, FK_Trabalha3 PK_Trabalha) Values();
INSERT INTO Trabalha (Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao, FK_Trabalha1, FK_Trabalha2, FK_Trabalha3 PK_Trabalha) Values();
INSERT INTO Trabalha (Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao, FK_Trabalha1, FK_Trabalha2, FK_Trabalha3 PK_Trabalha) Values();
INSERT INTO Trabalha (Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao, FK_Trabalha1, FK_Trabalha2, FK_Trabalha3 PK_Trabalha) Values();
INSERT INTO Trabalha (Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao, FK_Trabalha1, FK_Trabalha2, FK_Trabalha3 PK_Trabalha) Values();

