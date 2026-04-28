from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

# 1. CONFIGURAÇÕES (Sempre ANTES do SQLAlchemy)
app = Flask(__name__) # Em app encontra-se o nosso servidor web de Flask

# Caminho correto para: C:\...\GestordeTarefas\database\tarefas.db
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///../database/tarefas.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# 2. INICIALIZAÇÃO DO BANCO DE DADOS
db = SQLAlchemy(app) # Cursor para a base de dados SQLite

class Tarefa(db.Model):
    __tablename__ = "tarefas"
    id = db.Column(db.Integer, primary_key=True) # Identificador único de cada tarefa (não pode haver duas tarefas com o mesmo id, por isso é primary key)
    conteúdo = db.Column(db.String(200)) # Conteúdo da tarefa, um texto de máximo 200 caracteres
    feita = db.Column(db.Boolean) # Booleano que indica se uma tarefa foi feita ou não

# CORREÇÃO CRÍTICA: Criar as tabelas dentro do contexto da aplicação
with app.app_context():
    db.create_all() # Criação das tabelas se elas ainda não existirem

# 3. ROTAS DO SERVIDOR
@app.route('/', methods=['GET'])
def home():
    return render_template("index.html")

# 4. ARRANQUE DO SERVIDOR
if __name__ == '__main__':
    app.run(debug=True)# O debug=True faz com que cada vez que reiniciemos o servidor ou modifiquemos o código, o servidor de Flask reinicia-se sozinho

