from flask import Flask, request, jsonify
from app import app, db
from models import *
import json


@app.route("/")
def home():
    return "Home"


@app.route("/login", methods=['POST'])
def login():
    data=request.data
    data=json.loads(data.decode('utf-8'))
    username=data['username']
    password=data['password']
    print(username,password)

    # username = request.form.get('username')
    # password = request.form.get('password')

    msg = ""
    if not username or not password:
        msg = {"status": {"type": "failure", "message": "Missing Data"}}
        return jsonify(msg)

    user = User.query.filter_by(username=username).first()
    print(User.query.filter_by(username=username).first())
    print(user)
    if user is None or not user.check_password(password):
        msg = {"status": {"type": "failure", "message": "Username or password incorrect"}}
    else:
        msg = {"status": {"type": "success",
                          "message": "You logged in"},
               "data": {"user": user.getJsonData()}
               }

    return jsonify(msg)


@app.route("/register", methods=['POST'])
def register():
    
    global response;
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))

    username = request_data['username']
    name = request_data['fullname']
    password = request_data['password']

    email = request_data['email']

    msg = ""
    if not username or not password or not email or not name:
        msg = {"status": {"type": "failure", "message": "missing data"}}
        return jsonify(msg)
    
    if User.query.filter_by(username=username).count() == 1:
        msg = {"status": {"type": "failure", "message": "username already taken"}}
        return jsonify(msg)
    
    if User.query.filter_by(email=email).count() == 1:
        msg = {"status": {"type": "failure", "message": "email already taken"}}
        return jsonify(msg)
    
    u = User()
    u.username = username
    u.name = name
    u.email = email
    u.set_password(password)

    db.session.add(u)
    db.session.commit()

    msg = {"status": '{"type": "success", "message": "You have registered"}'}
    return jsonify(msg)