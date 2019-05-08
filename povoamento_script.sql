
INSERT INTO Genero (Nome, Popularidade) VALUES ('Ação', 'Alta');
INSERT INTO Genero (Nome, Popularidade) VALUES ('Comédia', 'Alta');
INSERT INTO Genero (Nome, Popularidade) VALUES ('Romance', 'Média');

INSERT INTO Diretor (Nome, Nacionalidade, Data_Nascimento) VALUES ('Steven Spielberg', 'Americana', to_date ('29/08/1968', 'dd/mm/yyyy'));
INSERT INTO Diretor (Nome, Nacionalidade, Data_Nascimento) VALUES ('Tim Burton', 'Americana', to_date ('29/10/1974', 'dd/mm/yyyy'));
INSERT INTO Diretor (Nome, Nacionalidade, Data_Nascimento) VALUES ('Tarantino', 'Americana', to_date ('12/09/1972', 'dd/mm/yyyy'));

INSERT INTO TITULO (Data, Nome, Classificacao, Avaliacao, Codigo_Genero, Codigo_Diretor) VALUES (to_date ('16/04/1997', 'dd/mm/yyyy'), 'Star Wars', 'Livre', 9, 1, 1);
INSERT INTO TITULO (Data, Nome, Classificacao, Avaliacao, Codigo_Genero, Codigo_Diretor) VALUES (to_date ('07/05/2016', 'dd/mm/yyyy'), 'Harry Potter', 'Para maiores de 12 anos', 9, 2, 2);
INSERT INTO TITULO (Data, Nome, Classificacao, Avaliacao, Codigo_Genero, Codigo_Diretor) VALUES (to_date ('28/11/2000', 'dd/mm/yyyy'), 'As Crônicas de Nárnia', 'Para maiores de 10 anos',8, 3, 3);

INSERT INTO Estudio (Local, Nome, Data_Lancamento, Codigo_Titulo) VALUES ('Av Domingos Ferreira, 1000', 'Estudio Skyland', to_date ('16/04/1997', 'dd/mm/yyyy'), 1);
INSERT INTO Estudio (Local, Nome, Data_Lancamento, Codigo_Titulo) VALUES ('Av Conselheiro Aguiar, 1000', 'Estudio Midgard', to_date ('05/12/1995', 'dd/mm/yyyy'), 2);
INSERT INTO Estudio (Local, Nome, Data_Lancamento, Codigo_Titulo) VALUES ('Av Dezessete de Agosto, 1000', 'Estudio High Way to Hell', to_date ('20/10/2004', 'dd/mm/yyyy'), 3); 

INSERT INTO Lista (Data_Atualizacao, Nome) VALUES (to_date ('20/04/2019', 'dd/mm/yyyy'), 'Ver mais tarde');
INSERT INTO Lista (Data_Atualizacao, Nome) VALUES (to_date ('19/04/2019', 'dd/mm/yyyy'), 'Ver mais depois');
INSERT INTO Lista (Data_Atualizacao, Nome) VALUES (to_date ('20/04/2019', 'dd/mm/yyyy'), 'Gostei');

INSERT INTO Cartao_Credito (Numero, Codigo_Seguranca, Bandeira) VALUES (6661, 111, 'MasterCard');
INSERT INTO Cartao_Credito (Numero, Codigo_Seguranca, Bandeira) VALUES (6662, 112, 'Visa');
INSERT INTO Cartao_Credito (Numero, Codigo_Seguranca, Bandeira) VALUES (6663, 113, 'Elo');

INSERT INTO Usuario (Email, Data_Nascimento, Nome, Email_Administrador, Numero) VALUES ('user1@gmail.com', to_date ('20/04/1995', 'dd/mm/yyyy'), 'João das Neves', NULL, 6661);
INSERT INTO Usuario (Email, Data_Nascimento, Nome, Email_Administrador, Numero) VALUES ('user2@gmail.com', to_date ('23/08/1997', 'dd/mm/yyyy'), 'Eduardo Forte', 'user1@gmail.com', 6662);
INSERT INTO Usuario (Email, Data_Nascimento, Nome, Email_Administrador, Numero) VALUES ('user3@gmail.com', to_date ('15/09/1998', 'dd/mm/yyyy'), 'Samuel L Jackson', NULL, 6663);

INSERT INTO Serie (Codigo_Titulo, Qtd_Temporadas) VALUES (1, 2);
INSERT INTO Serie (Codigo_Titulo, Qtd_Temporadas) VALUES (2, 6);

INSERT INTO Filme (Codigo_Titulo, Duracao) VALUES (3, 123);

INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (1, 1, 60, 'A casa Caiu');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (1, 2, 60, 'A casa foi reconstruída');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (1, 3, 60, 'Constrói um prédio logo, ora');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (2, 1, 60, 'O império contra ataca');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (2, 2, 60, 'Os Jedi acaba com tudo');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (2, 3, 60, 'É uma Skywalker?');

INSERT INTO Adiciona (Email, Codigo_Lista, Codigo_Titulo) VALUES ('user1@gmail.com', 1, 1);
INSERT INTO Adiciona (Email, Codigo_Lista, Codigo_Titulo) VALUES ('user2@gmail.com', 2, 2);
INSERT INTO Adiciona (Email, Codigo_Lista, Codigo_Titulo) VALUES ('user3@gmail.com', 3, 3);

INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user1@gmail.com', 1, to_date ('20/04/2019', 'dd/mm/yyyy'));
INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user2@gmail.com', 2, to_date ('21/04/2019', 'dd/mm/yyyy'));
INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user3@gmail.com', 3, to_date ('20/04/2019', 'dd/mm/yyyy'));

INSERT INTO Dirige (Codigo_Titulo, Codigo_Diretor, Nome, Categoria_Premiacao, Ano) VALUES (1, 1, 'Cannes', 'Melhor Filme', to_date ('16/04/2019', 'dd/mm/yyyy'));

INSERT INTO Dirige (Codigo_Titulo, Codigo_Diretor, Nome, Categoria_Premiacao, Ano) VALUES (2, 2, 'Oscar', 'Melhor Filme', to_date ('21/04/2019', 'dd/mm/yyyy'));

--
INSERT INTO Premio (Categoria,  Codigo_Titulo, Codigo_Diretor, Nome, Valor) VALUES ('Melhor Filme', 1, 1, 'Prêmio Luana Amado', 30000);
INSERT INTO Premio (Categoria,  Codigo_Titulo, Codigo_Diretor, Nome, Valor) VALUES ('Melhor Atriz', 2, 2, 'Prêmio Gabriela Leal', 20000);
