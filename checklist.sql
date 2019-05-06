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

--38.
UPDATE Cartao_Credito
SET Codigo_Seguranca = ( 
  SELECT MAX(Codigo_Seguranca) + 1
  FROM Cartao_Credito
) 
WHERE Bandeira = 'Elo' OR Bandeira = 'MasterCard';

-- 48. 58.
DECLARE
    usersCount NUMBER;
BEGIN
    SELECT COUNT(Email) INTO usersCount
    FROM Usuario;
    DBMS_OUTPUT.PUT_LINE('Quantidade de suários cadastrados: ' ||usersCount);
END;
/

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
