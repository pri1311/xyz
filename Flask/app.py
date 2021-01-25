from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

import os


app = Flask(__name__)
current_direc = os.getcwd()
databasePath = os.path.join(current_direc,"database.db")

app.config['SQLALCHEMY_DATABSE_URI'] = 'sqllite:///'+databasePath
db = SQLAlchemy(app)
import routes, models



