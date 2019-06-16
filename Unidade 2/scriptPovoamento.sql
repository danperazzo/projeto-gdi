-- inserindo gêneros
INSERT INTO tb_Genero VALUES (1, 'Ação', 'Alta');
INSERT INTO tb_Genero VALUES (2, 'Comédia', 'Alta');
INSERT INTO tb_Genero VALUES (3, 'Romance', 'Média');
INSERT INTO tb_Genero VALUES (4, 'Drama', 'Alta');

-- inserindo diretores
INSERT INTO tb_Diretor VALUES (1, 'Steven Spielberg', 'Americana', to_date ('29/08/1968', 'dd/mm/yyyy'));
INSERT INTO tb_Diretor VALUES (2, 'Alan Taylor', 'Americana', to_date ('29/10/1965', 'dd/mm/yyyy'));
INSERT INTO tb_Diretor VALUES (3, 'Tarantino', 'Americana', to_date ('12/09/1972', 'dd/mm/yyyy'));
INSERT INTO tb_Diretor VALUES (4, 'Gary Ross', 'Americana', to_date ('03/11/1956', 'dd/mm/yyyy'));
INSERT INTO tb_Diretor VALUES (5, 'Lisa Joy', 'Americana', to_date ('18/05/1982', 'dd/mm/yyyy'));

-- inserindo séries
INSERT INTO tb_Serie VALUES (
    2,
    to_date ('07/05/2016', 'dd/mm/yyyy'),
    'Game Of Thrones',
    'Para maiores de 16 anos',
    10,
    (SELECT REF(G) FROM tb_Genero G WHERE G.Codigo_Genero = 1),
    (SELECT REF(D) FROM tb_Diretor D WHERE D.Codigo_Diretor = 2),
    8
);
INSERT INTO tb_Serie VALUES (
    5,
    to_date ('10/11/2014', 'dd/mm/yyyy'),
    'Westworld',
    'Para maiores de 14 anos',
    8,
    (SELECT REF(G) FROM tb_Genero G WHERE G.Codigo_Genero = 1),
    (SELECT REF(D) FROM tb_Diretor D WHERE D.Codigo_Diretor = 5),
    2
);

-- inserindo filmes
INSERT INTO tb_Filme VALUES (
    1,
    to_date ('28/11/2000', 'dd/mm/yyyy'),
    'E.T.: O Extraterrestre',
    'Para maiores de 10 anos',
    8,
    (SELECT REF(G) FROM tb_Genero G WHERE G.Codigo_Genero = 4),
    (SELECT REF(D) FROM tb_Diretor D WHERE D.Codigo_Diretor = 1),
    123
);
INSERT INTO tb_Filme VALUES (
    3,
    to_date ('16/04/1997', 'dd/mm/yyyy'),
    'Kill Bill',
    'Para maiores de 16 anos',
    9,
    (SELECT REF(G) FROM tb_Genero G WHERE G.Codigo_Genero = 1),
    (SELECT REF(D) FROM tb_Diretor D WHERE D.Codigo_Diretor = 3),
    123
);
INSERT INTO tb_Filme VALUES (
    4,
    to_date ('10/11/2014', 'dd/mm/yyyy'),
    'Jogos Vorazes',
    'Para maiores de 10 anos',
    8,
    (SELECT REF(G) FROM tb_Genero G WHERE G.Codigo_Genero = 3),
    (SELECT REF(D) FROM tb_Diretor D WHERE D.Codigo_Diretor = 4),
    90
);

-- inserindo episódios de série
INSERT INTO tb_Episodios_Serie VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 2),
    1,
    45,
    'Winter Is Coming',
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 2)
);
INSERT INTO tb_Episodios_Serie VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 2),
    2,
    47,
    'The Kings Road',
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 2)
);
INSERT INTO tb_Episodios_Serie VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 2),
    3,
    50,
    'Lord Snow',
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 2)
);
INSERT INTO tb_Episodios_Serie VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 2),
    4,
    48,
    'Cripples, Bastards, and Broken Things',
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 2)
);
INSERT INTO tb_Episodios_Serie VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 5),
    1,
    55,
    'The Original',
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 5)
);
INSERT INTO tb_Episodios_Serie VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 5),
    2,
    55,
    'Chestnut',
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 5)
);
INSERT INTO tb_Episodios_Serie VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 5),
    3,
    55,
    'The Stray',
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 5)
);
INSERT INTO tb_Episodios_Serie VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 5),
    4,
    55,
    'Dissonance Theory',
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 5)
);

-- inserindo estúdios
INSERT INTO tb_Estudio VALUES (
    1,
    '5th Avenue, 15',
    'Miramax',
    to_date ('16/04/1997', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Titulo T WHERE T.Codigo_Titulo = 1)
);
INSERT INTO tb_Estudio VALUES (
    2,
    '7th Avenue, 30',
    'HBO Sudios',
    to_date ('05/12/1995', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Titulo T WHERE T.Codigo_Titulo = 2)
);
INSERT INTO tb_Estudio VALUES (
    3,
    'Universal, Orlando',
    'Universal Studios',
    to_date ('20/10/2004', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Titulo T WHERE T.Codigo_Titulo = 3)
);
INSERT INTO tb_Estudio VALUES (
    4,
    'Rodeo Drive, 140',
    'Liongate',
    to_date ('20/10/2004', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Titulo T WHERE T.Codigo_Titulo = 4)
);
INSERT INTO tb_Estudio VALUES (
    5,
    '7th Avenue, 30',
    'HBO',
    to_date ('20/10/2004', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Titulo T WHERE T.Codigo_Titulo = 5)
); 

-- inserindo listas
INSERT INTO tb_Lista VALUES (1, to_date ('20/04/2019', 'dd/mm/yyyy'), 'Ver mais tarde');
INSERT INTO tb_Lista VALUES (2, to_date ('19/04/2019', 'dd/mm/yyyy'), 'Ver mais depois');
INSERT INTO tb_Lista VALUES (3, to_date ('20/04/2019', 'dd/mm/yyyy'), 'Gostei');

-- inserindo cartões de crédito
INSERT INTO tb_Cartao_Credito VALUES (6661, 111, 'MasterCard');
INSERT INTO tb_Cartao_Credito VALUES (6662, 112, 'Visa');
INSERT INTO tb_Cartao_Credito VALUES (6663, 113, 'Elo');

-- inserindo usuários
INSERT INTO tb_Usuario VALUES (
    'user1@gmail.com',
    to_date ('20/04/1995', 'dd/mm/yyyy'),
    'João das Neves',
    NULL,
    (SELECT REF(C) FROM tb_Cartao_Credito C WHERE C.Numero = 6661)
);
INSERT INTO tb_Usuario VALUES (
    'user2@gmail.com',
    to_date ('23/08/1997', 'dd/mm/yyyy'),
    'Eduardo Forte',
    (SELECT REF(U) FROM tb_Usuario U WHERE U.Email = 'user1@gmail.com'),
    (SELECT REF(C) FROM tb_Cartao_Credito C WHERE C.Numero = 6662)
);
INSERT INTO tb_Usuario VALUES (
    'user3@gmail.com',
    to_date ('15/09/1998', 'dd/mm/yyyy'),
    'Samuel L Jackson',
    NULL,
    (SELECT REF(C) FROM tb_Cartao_Credito C WHERE C.Numero = 6663)
);

-- inserindo títulos às listas (adiciona)
INSERT INTO tb_Adiciona VALUES (
    'user1@gmail.com',
    (SELECT L.Codigo_Lista FROM tb_Lista L WHERE L.Codigo_Lista = 1),
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 1),
    (SELECT REF(L) FROM tb_Lista L WHERE L.Codigo_Lista = 1),
    (SELECT REF(T) FROM tb_Filme T WHERE T.Codigo_Titulo = 1)
);
INSERT INTO tb_Adiciona VALUES (
    'user2@gmail.com',
    (SELECT L.Codigo_Lista FROM tb_Lista L WHERE L.Codigo_Lista = 2),
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 2),
    (SELECT REF(L) FROM tb_Lista L WHERE L.Codigo_Lista = 2),
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 2)
);
INSERT INTO tb_Adiciona VALUES (
    'user3@gmail.com',
    (SELECT L.Codigo_Lista FROM tb_Lista L WHERE L.Codigo_Lista = 3),
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 1),
    (SELECT REF(L) FROM tb_Lista L WHERE L.Codigo_Lista = 3),
    (SELECT REF(T) FROM tb_Filme T WHERE T.Codigo_Titulo = 1)
);

-- inserindo títulos assistidos (assiste)
INSERT INTO tb_Assiste VALUES (
    'user1@gmail.com',
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 1),
    to_date ('20/04/2019', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Filme T WHERE T.Codigo_Titulo = 1)
);
INSERT INTO tb_Assiste VALUES (
    'user1@gmail.com',
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 3),
    to_date ('22/04/2019', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Filme T WHERE T.Codigo_Titulo = 3)
);
INSERT INTO tb_Assiste VALUES (
    'user2@gmail.com',
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 2),
    to_date ('21/04/2019', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 2)
);
INSERT INTO tb_Assiste VALUES (
    'user2@gmail.com',
    (SELECT T.Codigo_Titulo FROM tb_Serie T WHERE T.Codigo_Titulo = 5),
    to_date ('06/05/2019', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Serie T WHERE T.Codigo_Titulo = 5)
);
INSERT INTO tb_Assiste VALUES (
    'user3@gmail.com',
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 3),
    to_date ('24/04/2019', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Filme T WHERE T.Codigo_Titulo = 3)
);
INSERT INTO tb_Assiste VALUES (
    'user3@gmail.com',
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 4),
    to_date ('07/05/2019', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Filme T WHERE T.Codigo_Titulo = 4)
);

-- inserindo relação entre títulos e diretores (dirige)
INSERT INTO tb_Dirige VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 1),
    (SELECT D.Codigo_Diretor FROM tb_Diretor D WHERE D.Codigo_Diretor = 1),
    'Cannes',
    'Melhor Filme',
    to_date ('16/04/2019', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Filme T WHERE T.Codigo_Titulo = 1),
    (SELECT REF(D) FROM tb_Diretor D WHERE D.Codigo_Diretor = 1)
);
INSERT INTO tb_Dirige VALUES (
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 3),
    (SELECT D.Codigo_Diretor FROM tb_Diretor D WHERE D.Codigo_Diretor = 3),
    'Oscar',
    'Melhor Filme',
    to_date ('21/04/2019', 'dd/mm/yyyy'),
    (SELECT REF(T) FROM tb_Filme T WHERE T.Codigo_Titulo = 3),
    (SELECT REF(D) FROM tb_Diretor D WHERE D.Codigo_Diretor = 3)
);

-- inserindo prêmios
INSERT INTO tb_Premio VALUES (
    'Melhor Filme',
    (SELECT T.Codigo_Titulo FROM tb_Filme T WHERE T.Codigo_Titulo = 1),
    (SELECT D.Codigo_Diretor FROM tb_Diretor D WHERE D.Codigo_Diretor = 1),
    'Prêmio Luana Amado',
    30000,
    (SELECT REF(T) FROM tb_Titulo T WHERE T.Codigo_Titulo = 1),
    (SELECT REF(D) FROM tb_Diretor D WHERE D.Codigo_Diretor = 1)
);