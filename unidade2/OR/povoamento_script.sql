INSERT INTO tb_Cliente (n_cadastro, CPF,Nascimento) VALUES (1,1111,to_date ('29/08/1968', 'DD/MM/YYYY'));
INSERT INTO tb_Cliente (n_cadastro, CPF,Nascimento) VALUES (2,2222,to_date ('29/08/1969', 'DD/MM/YYYY'));
INSERT INTO tb_Cliente (n_cadastro, CPF,Nascimento) VALUES (3,3333,to_date ('29/08/1970', 'DD/MM/YYYY'));
INSERT INTO tb_Cliente (n_cadastro, CPF,Nascimento) VALUES (4,4444,to_date ('29/08/1971', 'DD/MM/YYYY'));
INSERT INTO tb_Cliente (n_cadastro, CPF,Nascimento) VALUES (5,5555,to_date ('29/08/1972', 'DD/MM/YYYY'));

INSERT INTO tb_Estudante (n_cadastro_Estudo, UNE) VALUES (1,1);
INSERT INTO tb_Estudante (n_cadastro_Estudo, UNE) VALUES (2,2);

INSERT INTO tb_Comum (n_cadastro_Comum) VALUES (3);
INSERT INTO tb_Comum (n_cadastro_Comum) VALUES (4);
INSERT INTO tb_Comum (n_cadastro_Comum) VALUES (5);

INSERT INTO tb_Filho (n_cadastro_pai,IdFilho,Nascimento,Cadeirinha) VALUES (3,1,to_date('29/08/2000', 'DD/MM/YYYY'),'1');
INSERT INTO tb_Filho (n_cadastro_pai,IdFilho,Nascimento,Cadeirinha) VALUES (4,2,to_date('29/08/2001', 'DD/MM/YYYY'),'0');
INSERT INTO tb_Filho (n_cadastro_pai,IdFilho,Nascimento,Cadeirinha) VALUES (5,3,to_date('29/08/2002', 'DD/MM/YYYY'),'1');


INSERT INTO tb_Assento(Fileira, Numero,Limpeza, Dbox,Adaptavel) VALUES (
'G','7',to_date('29/08/2005' , 'DD/MM/YYYY'),'1','0');
INSERT INTO tb_Assento(Fileira, Numero,Limpeza, Dbox,Adaptavel) VALUES (
'G','8',to_date('29/08/2004' , 'DD/MM/YYYY'),'0','1');
INSERT INTO tb_Assento(Fileira, Numero,Limpeza, Dbox,Adaptavel) VALUES (
'G','9',to_date('29/08/2003' , 'DD/MM/YYYY'),'1','1');
INSERT INTO tb_Assento(Fileira, Numero,Limpeza, Dbox,Adaptavel) VALUES (
'G','2',to_date('29/08/2002' , 'DD/MM/YYYY'),'0','0');
INSERT INTO tb_Assento(Fileira, Numero,Limpeza, Dbox,Adaptavel) VALUES (
'A','3',to_date('29/08/2006' , 'DD/MM/YYYY'),'1','1');
INSERT INTO tb_Assento(Fileira, Numero,Limpeza, Dbox,Adaptavel) VALUES (
'A','4',to_date('29/08/2001' , 'DD/MM/YYYY'),'1','0');
INSERT INTO tb_Assento(Fileira, Numero,Limpeza, Dbox,Adaptavel) VALUES (
'A','7',to_date('29/08/1999' , 'DD/MM/YYYY'),'0','0');

INSERT INTO tb_Filme (Nome, Film_ID, EstreiaData, Seq_ID) VALUES ('E.T.: O Extraterrestre', 0, to_date('29/08/1999', 'DD/MM/YYYY'), NULL);
INSERT INTO tb_Filme (Nome, Film_ID, EstreiaData, Seq_ID) VALUES ('Kill Bill', 1, to_date('29/08/2019', 'DD/MM/YYYY'), NULL);
INSERT INTO tb_Filme (Nome, Film_ID, EstreiaData, Seq_ID) VALUES ('Monstros VS Alienigenas', 2, to_date('29/03/1955', 'DD/MM/YYYY'), NULL);
INSERT INTO tb_Filme (Nome, Film_ID, EstreiaData, Seq_ID) VALUES ('Crespusculo', 3, to_date('29/03/2007', 'DD/MM/YYYY'), NULL);
INSERT INTO tb_Filme (Nome, Film_ID, EstreiaData, Seq_ID) VALUES ('Crespusculo Advanced', 4, to_date('29/03/2008', 'DD/MM/YYYY'), 3);
INSERT INTO tb_Filme (Nome, Film_ID, EstreiaData, Seq_ID) VALUES ('Wall-E', 5, to_date('29/03/2000', 'DD/MM/YYYY'), NULL);
INSERT INTO tb_Filme (Nome, Film_ID, EstreiaData, Seq_ID) VALUES ('Bill Kill Bill', 6, to_date('29/03/2025', 'DD/MM/YYYY'), 1);
INSERT INTO tb_Filme (Nome, Film_ID, EstreiaData, Seq_ID) VALUES ('Dois doidões em Harvard 2', 7, to_date('29/05/2100', 'DD/MM/YYYY'), NULL);

INSERT INTO tb_Sessao ( Sala, Horario, InicioData, TresD, Evento, Film_ID) VALUES ('tres','11:59',to_date('29/03/2025', 'DD/MM/YYYY'),'0','Filme',0);
INSERT INTO tb_Sessao ( Sala, Horario, InicioData, TresD, Evento, Film_ID) VALUES ('dois','11:47',to_date('29/03/2004', 'DD/MM/YYYY'),'1','Peca',1);
INSERT INTO tb_Sessao ( Sala, Horario, InicioData, TresD, Evento, Film_ID) VALUES ('um','12:59',to_date('29/03/2010', 'DD/MM/YYYY'),'0','Filme',2);
INSERT INTO tb_Sessao ( Sala, Horario, InicioData, TresD, Evento, Film_ID) VALUES ('zero','11:59',to_date('29/03/2025', 'DD/MM/YYYY'),'0','Filme',3);
INSERT INTO tb_Sessao ( Sala, Horario, InicioData, TresD, Evento, Film_ID) VALUES ('dois','11:59',to_date('29/03/2025', 'DD/MM/YYYY'),'0','Filme',4);
INSERT INTO tb_Sessao ( Sala, Horario, InicioData, TresD, Evento, Film_ID) VALUES ('tres','11:58',to_date('29/03/2000', 'DD/MM/YYYY'),'0','Filme',5);
INSERT INTO tb_Sessao ( Sala, Horario, InicioData, TresD, Evento, Film_ID) VALUES ('seis','11:59',to_date('29/03/2025', 'DD/MM/YYYY'),'0','Filme',6);
INSERT INTO tb_Sessao ( Sala, Horario, InicioData, TresD, Evento, Film_ID) VALUES ('tres','11:57',to_date('29/03/2008', 'DD/MM/YYYY'),'0','Filme',7);

INSERT INTO tb_Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco,Desconto) VALUES ('G', '7', '11:59','tres',1,5.5, 3);
INSERT INTO tb_Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco,Desconto) VALUES ('G', '8', '11:47','dois',2,5.5, 2);
INSERT INTO tb_Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco,Desconto) VALUES ('G', '9', '12:59','um',3,5.5, 1);
INSERT INTO tb_Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco,Desconto) VALUES ('G', '2', '11:59','zero',4,5.5, 4);
INSERT INTO tb_Ingresso (Assento_Fileira, Assento_Numero, Sessao_Horario, Sessao_Sala, Cliente_id, Preco,Desconto) VALUES ('A', '7', '11:58','tres',5,5.5, 3);

INSERT INTO tb_GeneroFilme (genero,ID_filme) VALUES  ( 'Ficcao' , 0);
INSERT INTO tb_GeneroFilme (genero, ID_filme) VALUES ( 'Acao' , 1);
INSERT INTO tb_GeneroFilme (genero, ID_filme) VALUES ( 'Animacao' , 2);
INSERT INTO tb_GeneroFilme (genero, ID_filme) VALUES ( 'Drama' , 3);
INSERT INTO tb_GeneroFilme (genero, ID_filme) VALUES ( 'Drama' , 4);
INSERT INTO tb_GeneroFilme (genero, ID_filme) VALUES ( 'Animacao' , 5);
INSERT INTO tb_GeneroFilme (genero, ID_filme) VALUES ( 'Acao' , 6);
INSERT INTO tb_GeneroFilme (genero, ID_filme) VALUES ( 'Comedia' , 7);

INSERT INTO tb_Funcionario (ID_func, Aniversario, Sexo, Salario) VALUES
(1,to_date ('29/08/1968', 'DD/MM/YYYY'),'M',3);
INSERT INTO tb_Funcionario (ID_func, Aniversario, Sexo, Salario) VALUES
(2,to_date ('29/08/1969', 'DD/MM/YYYY'),'F',5);
INSERT INTO tb_Funcionario (ID_func, Aniversario, Sexo, Salario) VALUES
(3,to_date ('29/08/2005', 'DD/MM/YYYY'),'M',2);
INSERT INTO tb_Funcionario (ID_func, Aniversario, Sexo, Salario) VALUES
(4,to_date ('29/08/1900', 'DD/MM/YYYY'),'F',10);
INSERT INTO tb_Funcionario (ID_func, Aniversario, Sexo, Salario) VALUES
(5,to_date ('29/08/2001', 'DD/MM/YYYY'),'F',1);

INSERT INTO tb_CarrinhoDeComida (ID_car,Revisao) VALUES(1,to_date ('29/08/2010', 'DD/MM/YYYY'));
INSERT INTO tb_CarrinhoDeComida (ID_car,Revisao) VALUES(2,to_date ('29/08/2015', 'DD/MM/YYYY'));

INSERT INTO tb_Comida_Carrinho(ID_Carrinho, comida) VALUES(1, 'chocolate');
INSERT INTO tb_Comida_Carrinho(ID_Carrinho, comida) VALUES(2, 'pipoca');

INSERT INTO tb_Bebida_Carrinho(ID_Carrinho, bebida) VALUES (1,'sodas');
INSERT INTO tb_Bebida_Carrinho(ID_Carrinho, bebida) VALUES(1, 'agua');

INSERT INTO tb_Trabalha(Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao) VALUES (1,1,'11:59','tres','Vendas');
INSERT INTO tb_Trabalha(Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao) VALUES (2,1,'11:47','dois','Limpeza');
INSERT INTO tb_Trabalha(Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao) VALUES (3,2,'12:59','um','Vendas');
INSERT INTO tb_Trabalha(Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao) VALUES (4,2,'11:59','zero','Vendas');
INSERT INTO tb_Trabalha(Funcionario_id, Carrinho_come_id, Sessao_hor, Sessao_sala, Funcao) VALUES (5,2,'11:58','tres','Limpeza');

