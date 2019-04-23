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



