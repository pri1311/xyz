from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

import os


app = Flask(__name__)

# @app.before_first_request
# def create_tables():
#     db.create_all()

current_direc = os.getcwd()
databasePath = os.path.join(current_direc,"database.db")


app.config['SQLALCHEMY_DATABSE_URI'] = 'sqlite:///'+databasePath
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['PROPAGATE_EXCEPTIONS'] = True
db = SQLAlchemy(app)

from routes import *

# if __name__ == '__main__':
#     app.run(port=8000)
#     print(databasePath)

