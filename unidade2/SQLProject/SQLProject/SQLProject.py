#interface com estruturas para acessar e manipular o banco
import cx_Oracle 


#faz a conexao com o banco
conn = cx_Oracle.connect(user='system', password='welcome01')
conn.autocommit = True

#cria um novo cursor para manipular o db
c = conn.cursor()

#Loop do menu
while(True):

	#pega a seleção do usuário
	val = input('Bem vindo ao Menu! Digite 1 para sair, 2 para deletar, 3 para atualizar, 4 para inserir e 5 para selecionar de uma tabela!\n')
	if (int(val)==1):
		break
	#pega o comando que o usuário irá fazer
	command = input('digite o comando que voce gostaria de fazer em sql\n')
	c.execute(command)

	contador = 0
	#Printa o resultado da seleção
	if( int(val) == 5):

		for desc in c.description:
			print(str(desc[0]) +'        ',end='')
			
		print('\n')

		for row in c:

			contador = contador +1
			print (str(row[2]))

			for atr in row:
				print(str(atr) + '  ',end='')

			print('\n')


















conn.close()