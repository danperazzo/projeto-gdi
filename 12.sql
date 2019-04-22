-- 12
ALTER TABLE Adiciona
ADD CONSTRAINT adiciona_fk3 foreign key ((Codigo_Titulo, Numero_Episodio)) 
references Episodios((Codigo_Titulo, Numero_Episodio))
