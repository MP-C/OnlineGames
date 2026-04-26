from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

# 1. CONFIGURAÇÕES (Sempre ANTES do SQLAlchemy)
app = Flask(__name__) # Em app encontra-se o nosso servidor web de Flask

# Caminho correto para: C:\...\GestordeTarefas\database\tarefas.db
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////database/tarefas.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# 2. INICIALIZAÇÃO DO BANCO DE DADOS
db = SQLAlchemy(app) # Cursor para a base de dados SQLite

# 3. ROTAS DO SERVIDOR
@app.route('/', methods=['GET'])
def home():
    return render_template("index.html")

# 4. ARRANQUE DO SERVIDOR
if __name__ == '__main__':
    app.run(debug=True)# O debug=True faz com que cada vez que reiniciemos o servidor ou modifiquemos o código, o servidor de Flask reinicia-se sozinho

