import sqlite3


class DB:
    
    conn = sqlite3.connect('test.db')
    cs = conn.cursor()

    @classmethod
    def close(cls):
        cls.conn.close()

    @classmethod
    def execute(cls, com):
        ex = cls.cs.execute(com)
        cls.conn.commit()
        return ex

class Menu:

    def __init__(self):
        print()
        print("Escolher ação:")
        print("1 - Encerrar")
        print("2 - Inserção")
        print("3 - Atualização")
        print("4 - Remoção")
        print("5 - Seleção")
        action = int(input())

        self.call_action(action)

    def call_action(self, action):
        if action == 1: Menu.finish()
        elif action == 2: Menu.insert()
        elif action == 3: Menu.update()
        elif action == 4: Menu.delete()
        elif action == 5: Menu.select()
        else: Menu.default()

    @staticmethod
    def default():
        print("Ação inválida! Selecione novamente.")

    @staticmethod
    def finish():
        print("Encerrando...")
        exit(0)

    @staticmethod
    def insert():
        com = input("Insira o comando de inserção: ")
        DB.execute(com)
        print("Linha inserida com sucesso!")

    @staticmethod
    def update():
        com = input("Insira o comando de atualização: ")
        DB.execute(com)
        print("Linha(s) atualizada(s) com sucesso!")

    @staticmethod
    def delete():
        com = input("Insira o comando de deleção: ")
        DB.execute(com)
        print("Linha(s) deletada(s) com sucesso!")

    @staticmethod
    def select():
        com = input("Insira o comando de projeção: ")
        r = DB.execute(com)

        names = list(map(lambda x: x[0], r.description))

        for name in names:
            print(name, end="\t")
        
        print()
        for line in r.fetchall():
            for val in line:
                print(val, end="\t")
            print()


if __name__ == "__main__":
    while True:
        Menu()