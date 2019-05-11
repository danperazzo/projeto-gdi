-- Checklist

-- 1.
Select *
From Filme F
Where Duracao BETWEEN 40 AND 180

-- 2.
Select D.Nome
From Diretor D
Where Data_Nascimento between '01-JAN-70' and '01-JAN-73'

-- 3.
Select D.Nome
From Diretor D
Where D.Nome like '%T%'

-- 4. and 5.
Select CD.Bandeira
From Cartao_Credito CD
Where numero in (6660, 6664, 6662) or numero is null

-- 6.
Select *
From TITULO t
Where Avaliacao >= 9
Order by Nome

-- 7.
Create View usuarioInfo as
Select Nome,
Email,
Email_Administrador as Administrador
From Usuario

-- 8.
Select * 
from usuarioInfo
Where Administrador is not null

-- 9.
Drop view usuarioInfo

-- 10.
Alter Table TITULO
add constraint CHK_Avaliacao Check(Avaliacao >= 5)

-- 11.
Alter Table Usuario
add constraint PK_usuario primary key(Email, Numero)

-- 12.


-- 13.
Alter Table Premio
Modify Valor Default 10000;

-- 14.
Alter Table Genero
Modify Popularidade VARCHAR(40)

-- 15.
Alter Table Episodios
Add Lancamento Date

-- 16.
Alter Table Episodios
Drop Column Lancamento

-- 17.
Select P.Valor, P.Valor/1000 as Divisao
From Premio P

-- 18.
Select AVG(P.Valor)
From Premio P

-- 19.
Select P.Categoria, AVG(P.Valor) 
From Premio P
Group By Categoria

-- 20.
Select Distinct D.Categoria_Premiacao
From Dirige D

-- 21.
Select P.Categoria, AVG(P.Valor) 
From Premio P
Group By Categoria
Having AVG(P.Valor) > 25000

-- 22.
Select P.Categoria, AVG(P.Valor) 
From Premio P
Group By Categoria
Having AVG(P.Valor) > (
    Select Min(P.Valor)
    From Premio P
)

-- 23.
Select EP.Nome, AVG(Duracao) as MediaDuracao
From Episodios EP
Where EP.Nome like '%ca%'
Group by Nome
Having AVG(Duracao) >= 60

-- 24.
SELECT *
FROM Serie s JOIN Assiste a ON s.Codigo_Titulo = a.Codigo_Titulo
WHERE a.Email = 'user1@gmail.com'

-- 26.
SELECT *
FROM Serie s INNER JOIN Assiste a ON s.Codigo_Titulo = a.Codigo_Titulo

-- 27.
SELECT f.Nome
FROM Titulo f LEFT JOIN Dirige d ON f.Codigo_Titulo = d.Codigo_Titulo
WHERE d.Codigo_Titulo IS NULL

-- 28.
SELECT DISTINCT title.Nome FROM Adiciona ad RIGHT JOIN Titulo title ON title.Codigo_Titulo = ad.Codigo_Titulo
WHERE ad.Codigo_Titulo IS NULL

-- 29.

-- 30.
Select U.Nome as NomeUsuario
From Usuario U
Where U.Data_Nascimento = Any
(Select D.Data_Nascimento from Diretor D)

-- 31.
Select D.Nome as NomeDiretor
From Diretor D
Where D.Codigo_Diretor = All
(Select T.Codigo_Diretor From TITULO T Where T.Avaliacao > 9)

-- 32.
Select T.Nome as NomeTitulo
From TITULO T
Where exists
(Select * From Genero G Where T.Codigo_Genero == G.Codigo_Genero and G.Popularidade = "Baixa")

-- 33. (já inserida em outras questões)

-- 34.
Select Nome from Diretor
Union
Select Nome from Usuario
Order By Nome

-- 35.
Select Codigo_Titulo from Filme
Intersect
Select Codigo_Titulo from Assiste

--36.
SELECT Numero
FROM Usuario
WHERE Email_Administrador IS NOT NULL
MINUS
SELECT Numero
FROM Cartao_Credito
WHERE Numero = '6661';

-- 37.

--38.
UPDATE Cartao_Credito
SET Codigo_Seguranca = ( 
  SELECT MAX(Codigo_Seguranca) + 1
  FROM Cartao_Credito) 
WHERE Bandeira = 'Elo' OR Bandeira = 'MasterCard';

--39.
DELETE 
FROM Usuario 
WHERE Numero = (SELECT MAX(Numero) FROM Usuario); 

-- 40. grant

-- 41. revoke

--42.
select Codigo_Diretor 
from
    (select Codigo_Diretor
    from Diretor
    group by Nacionalidade) as x
inner join TITULO as y on x.Codigo_Diretor = y.Codigo_Diretor;

--43.
SELECT SUM(Avaliacao)
FROM TITULO
WHERE Codigo_Titulo = '01' OR Codigo_Titulo = '02' OR Codigo_Titulo = '03' ;

-- 46.
SELECT *
FROM Episodios
ORDER BY Duracao, Codigo_Titulo, Numero_Episodio;

-- 47.
SELECT * FROM Titulo
WHERE EXISTS (SELECT * FROM Titulo t2, Assiste a WHERE a.Codigo_Titulo = t2.Codigo_Titulo);

-- 48. 58.
DECLARE
    usersCount NUMBER;
BEGIN
    SELECT COUNT(Email) INTO usersCount
    FROM Usuario;
    DBMS_OUTPUT.PUT_LINE('Quantidade de suários cadastrados: ' ||usersCount);
END;

-- 49. 56. 58.
DECLARE 
    nomeU Usuario.NOME%TYPE;
    nascU Usuario.DATA_NASCIMENTO%Type;
BEGIN
    SELECT NOME, DATA_NASCIMENTO INTO nomeU, nascU
    FROM Usuario
    WHERE Email = 'user1@gmail.com';
    DBMS_OUTPUT.PUT_LINE('Nome: ' ||nomeU);
    DBMS_OUTPUT.PUT_LINE('Data de nascimento: ' ||nascU);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Não existe usuário com este e-mail');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error');
END;

-- 50. 51. 53. 55. 63.
CREATE OR REPLACE PROCEDURE Avaliados IS

BEGIN
    FOR linha IN (SELECT Nome, Avaliacao FROM Titulo) LOOP
        IF (linha.Avaliacao = 10) THEN 
            DBMS_OUTPUT.PUT_LINE(linha.Nome || ': Melhores do ano');
        ELSE IF (linha.Avaliacao < 10 AND linha.Avaliacao > 8) THEN
            DBMS_OUTPUT.PUT_LINE(linha.Nome || ': Quase lá');
        ELSE
            DBMS_OUTPUT.PUT_LINE(linha.Nome || ': Irrelevante');
        END IF;
    END LOOP;
END;

-- 73. 81. 82
CREATE OR REPLACE TRIGGER numTempSerie
BEFORE INSERT OR UPDATE ON Serie
FOR EACH ROW
BEGIN
    IF (:new.Qtd_Temporadas < 1) THEN
        RAISE_APPLICATION_ERROR(-20003, 'Serie deve haver pelo menos uma temporada');
    END IF;

END;

-- 74. 80.
CREATE OR REPLACE TRIGGER AtualizaGenero
AFTER UPDATE OF Nome ON Genero
FOR EACH ROW

BEGIN
    DBMS_OUTPUT.PUT_LINE('Nome do genero atualizado para: ' || :new.Nome);
    DBMS_OUTPUT.PUT_LINE('Nome antigo: ' || :old.Nome);
END;

-- 83. 
CREATE OR REPLACE TRIGGER deletarEstudio
BEFORE DELETE ON Estudio
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20005, 'Estudios nao devem ser deletados.');
END;

-- 84.
CREATE OR REPLACE TRIGGER insertCartaoWhenInsertingUser
AFTER INSERT ON Usuario
FOR EACH ROW
BEGIN
    INSERT INTO Cartao_Credito (Numero, Codigo_Seguranca, Bandeira) VALUES (:new.Numero, 111, 'MasterCard');
END;

--85.
CREATE OR REPLACE TRIGGER whenDeletingGenero 
AFTER DELETE ON Genero
FOR EACH ROW
BEGIN
    UPDATE Titulo
    SET Codigo_Genero = NULL
    WHERE Codigo_Genero = :old.Codigo_Genero;
END;

--86.
CREATE OR REPLACE TRIGGER deleteAssisteWhenDeletingUser
AFTER DELETE ON Usuario
FOR EACH ROW
BEGIN
    DELETE FROM Assiste WHERE Email = :old.Email;
END;

-- 66.
CREATE OR REPLACE PROCEDURE toUpperCase(nome IN OUT VARCHAR) IS
BEGIN
    nome := UPPER(nome);
END;

-- 64. 65
CREATE OR REPLACE PROCEDURE idadeUsuario(dataNasc IN DATE, idade OUT NUMBER) IS
BEGIN
    idade := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM dataNasc);
END; 

-- 67.
DECLARE
    dataNasc DATE;
    idade NUMBER;
BEGIN
    SELECT Data_Nascimento INTO dataNasc FROM Usuario WHERE Email = 'user1@gmail.com';
    idadeUsuario(dataNasc, idade);
    DBMS_OUTPUT.PUT_LINE('Idade do usuário user1@gmail.com = ' || idade);
END;

--68.
CREATE OR REPLACE FUNCTION nomeDoMaisVelho
RETURN VARCHAR
IS
nome VARCHAR(50);
BEGIN
    SELECT Nome INTO nome FROM Usuario WHERE Data_Nascimento = (SELECT MIN(Data_Nascimento) FROM Usuario);
    DBMS_OUTPUT.PUT_LINE('Nome do usuário mais velho = ' || nome);
    RETURN nome;
END;

--69.
CREATE OR REPLACE FUNCTION nomeDoFilmeComDuracao(duracao IN NUMBER)
RETURN VARCHAR
IS
    nome VARCHAR(50);
BEGIN
    SELECT Nome INTO nome FROM Titulo WHERE Codigo_Titulo = (SELECT Codigo_Titulo FROM Filme WHERE Duracao = 123);
    RETURN nome;
END;

--70.
CREATE OR REPLACE FUNCTION oMaisBemAvaliado(nomeTitulo OUT VARCHAR)
RETURN VARCHAR
IS
BEGIN
    SELECT Nome INTO nomeTitulo FROM Titulo WHERE ROWNUM = 1 ORDER BY Avaliacao DESC;
    DBMS_OUTPUT.PUT_LINE('Nome do título mais bem avaliado: ' || nomeTitulo);
    RETURN nomeTitulo;
END;

--69. 72.
CREATE OR REPLACE PACKAGE my_pkg as

  TYPE textGroupArray IS TABLE OF VARCHAR2(50) INDEX BY BINARY_INTEGER;

  FUNCTION xMaisBemAvaliados(checksumNumber VARCHAR2) RETURN textGroupArray;
  FUNCTION oMaisBemAvaliado(nomeTitulo OUT VARCHAR) RETURN VARCHAR;

END my_pkg;

CREATE OR REPLACE PACKAGE BODY my_pkg AS

    CREATE OR REPLACE FUNCTION xMaisBemAvaliados(xPrimeiros IN NUMBER) 
    RETURN textGroupArray
    IS
        nome VARCHAR(50);
    BEGIN
        SELECT Nome INTO textGroupArray FROM TITULO WHERE ROWNUM <= xPrimeiros ORDER BY Avaliacao DESC;
    END;
END my_pkg;