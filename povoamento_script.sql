
INSERT INTO Genero (Nome, Popularidade) VALUES ('Ação', 'Alta');
INSERT INTO Genero (Nome, Popularidade) VALUES ('Comédia', 'Alta');
INSERT INTO Genero (Nome, Popularidade) VALUES ('Romance', 'Média');
INSERT INTO Genero (Nome, Popularidade) VALUES ('Drama', 'Média');

INSERT INTO Diretor (Nome, Nacionalidade, Data_Nascimento) VALUES ('Steven Spielberg', 'Americana', to_date ('29/08/1968', 'dd/mm/yyyy'));
INSERT INTO Diretor (Nome, Nacionalidade, Data_Nascimento) VALUES ('Alan Taylor', 'Americana', to_date ('29/10/1965', 'dd/mm/yyyy'));
INSERT INTO Diretor (Nome, Nacionalidade, Data_Nascimento) VALUES ('Tarantino', 'Americana', to_date ('12/09/1972', 'dd/mm/yyyy'));
INSERT INTO Diretor (Nome, Nacionalidade, Data_Nascimento) VALUES ('Gary Ross', 'Americana', to_date ('03/11/1956', 'dd/mm/yyyy'));
INSERT INTO Diretor (Nome, Nacionalidade, Data_Nascimento) VALUES ('Lisa Joy', 'Americana', to_date ('18/05/1982', 'dd/mm/yyyy'));

INSERT INTO TITULO (Data, Nome, Classificacao, Avaliacao, Codigo_Genero, Codigo_Diretor) VALUES (to_date ('28/11/2000', 'dd/mm/yyyy'), 'E.T.: O Extraterrestre', 'Para maiores de 10 anos', 8, 4, 1);
INSERT INTO TITULO (Data, Nome, Classificacao, Avaliacao, Codigo_Genero, Codigo_Diretor) VALUES (to_date ('07/05/2016', 'dd/mm/yyyy'), 'Game Of Thrones', 'Para maiores de 16 anos', 10, 1, 2);
INSERT INTO TITULO (Data, Nome, Classificacao, Avaliacao, Codigo_Genero, Codigo_Diretor) VALUES (to_date ('16/04/1997', 'dd/mm/yyyy'), 'Kill Bill', 'Para maiores de 16 anos', 9, 1, 3);
INSERT INTO TITULO (Data, Nome, Classificacao, Avaliacao, Codigo_Genero, Codigo_Diretor) VALUES (to_date ('10/11/2014', 'dd/mm/yyyy'), 'Jogos Vorazes', 'Para maiores de 10 anos', 8, 3, 4);
INSERT INTO TITULO (Data, Nome, Classificacao, Avaliacao, Codigo_Genero, Codigo_Diretor) VALUES (to_date ('10/11/2014', 'dd/mm/yyyy'), 'Westworld', 'Para maiores de 14 anos', 8, 1, 5);

INSERT INTO Estudio (Local, Nome, Data_Lancamento, Codigo_Titulo) VALUES ('5th Avenue, 15', 'Miramax', to_date ('16/04/1997', 'dd/mm/yyyy'), 1);
INSERT INTO Estudio (Local, Nome, Data_Lancamento, Codigo_Titulo) VALUES ('7th Avenue, 30', 'HBO Sudios', to_date ('05/12/1995', 'dd/mm/yyyy'), 2);
INSERT INTO Estudio (Local, Nome, Data_Lancamento, Codigo_Titulo) VALUES ('Universal, Orlando', 'Universal Studios', to_date ('20/10/2004', 'dd/mm/yyyy'), 3);
INSERT INTO Estudio (Local, Nome, Data_Lancamento, Codigo_Titulo) VALUES ('Rodeo Drive, 140', 'Liongate', to_date ('20/10/2004', 'dd/mm/yyyy'), 4);
INSERT INTO Estudio (Local, Nome, Data_Lancamento, Codigo_Titulo) VALUES ('7th Avenue, 30', 'HBO', to_date ('20/10/2004', 'dd/mm/yyyy'), 5); 

INSERT INTO Lista (Data_Atualizacao, Nome) VALUES (to_date ('20/04/2019', 'dd/mm/yyyy'), 'Ver mais tarde');
INSERT INTO Lista (Data_Atualizacao, Nome) VALUES (to_date ('19/04/2019', 'dd/mm/yyyy'), 'Ver mais depois');
INSERT INTO Lista (Data_Atualizacao, Nome) VALUES (to_date ('20/04/2019', 'dd/mm/yyyy'), 'Gostei');

INSERT INTO Cartao_Credito (Numero, Codigo_Seguranca, Bandeira) VALUES (6661, 111, 'MasterCard');
INSERT INTO Cartao_Credito (Numero, Codigo_Seguranca, Bandeira) VALUES (6662, 112, 'Visa');
INSERT INTO Cartao_Credito (Numero, Codigo_Seguranca, Bandeira) VALUES (6663, 113, 'Elo');

INSERT INTO Usuario (Email, Data_Nascimento, Nome, Email_Administrador, Numero) VALUES ('user1@gmail.com', to_date ('20/04/1995', 'dd/mm/yyyy'), 'João das Neves', NULL, 6661);
INSERT INTO Usuario (Email, Data_Nascimento, Nome, Email_Administrador, Numero) VALUES ('user2@gmail.com', to_date ('23/08/1997', 'dd/mm/yyyy'), 'Eduardo Forte', 'user1@gmail.com', 6662);
INSERT INTO Usuario (Email, Data_Nascimento, Nome, Email_Administrador, Numero) VALUES ('user3@gmail.com', to_date ('15/09/1998', 'dd/mm/yyyy'), 'Samuel L Jackson', NULL, 6663);

INSERT INTO Serie (Codigo_Titulo, Qtd_Temporadas) VALUES (2, 8);
INSERT INTO Serie (Codigo_Titulo, Qtd_Temporadas) VALUES (5, 2);

INSERT INTO Filme (Codigo_Titulo, Duracao) VALUES (1, 123);
INSERT INTO Filme (Codigo_Titulo, Duracao) VALUES (3, 123);
INSERT INTO Filme (Codigo_Titulo, Duracao) VALUES (4, 90);

INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (2, 1, 45, 'Winter Is Coming');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (2, 2, 47, 'The Kings Road');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (2, 3, 50, 'Lord Snow');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (2, 4, 48, 'Cripples, Bastards, and Broken Things');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (5, 1, 55, 'The Original');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (5, 2, 55, 'Chestnut');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (5, 3, 55, 'The Stray');
INSERT INTO Episodios (Codigo_Titulo, Numero_Episodio, Duracao, Nome) VALUES (5, 4, 55, 'Dissonance Theory');


INSERT INTO Adiciona (Email, Codigo_Lista, Codigo_Titulo) VALUES ('user1@gmail.com', 1, 1);
INSERT INTO Adiciona (Email, Codigo_Lista, Codigo_Titulo) VALUES ('user2@gmail.com', 2, 2);
INSERT INTO Adiciona (Email, Codigo_Lista, Codigo_Titulo) VALUES ('user3@gmail.com', 3, 1);

INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user1@gmail.com', 1, to_date ('20/04/2019', 'dd/mm/yyyy'));
INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user1@gmail.com', 3, to_date ('22/04/2019', 'dd/mm/yyyy'));
INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user2@gmail.com', 2, to_date ('21/04/2019', 'dd/mm/yyyy'));
INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user2@gmail.com', 5, to_date ('06/05/2019', 'dd/mm/yyyy'));
INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user3@gmail.com', 3, to_date ('24/04/2019', 'dd/mm/yyyy'));
INSERT INTO Assiste (Email, Codigo_Titulo, Data) VALUES ('user3@gmail.com', 4, to_date ('07/05/2019', 'dd/mm/yyyy'));

INSERT INTO Dirige (Codigo_Titulo, Codigo_Diretor, Nome, Categoria_Premiacao, Ano) VALUES (1, 1, 'Cannes', 'Melhor Filme', to_date ('16/04/2019', 'dd/mm/yyyy'));
INSERT INTO Dirige (Codigo_Titulo, Codigo_Diretor, Nome, Categoria_Premiacao, Ano) VALUES (3, 3, 'Oscar', 'Melhor Filme', to_date ('21/04/2019', 'dd/mm/yyyy'));

INSERT INTO Premio (Categoria,  Codigo_Titulo, Codigo_Diretor, Nome, Valor) VALUES ('Melhor Filme', 1, 1, 'Prêmio Luana Amado', 30000);
