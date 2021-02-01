from flask import Flask, request, jsonify
from app import app, db
from models import User
import json
import os
from twilio.rest import Client
import random
import sendgrid
from sendgrid.helpers.mail import *


@app.route('/')
def home():
    return "Home"


@app.route('/login', methods=['POST'])
def login():
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))

    username = request_data['username']
    password = request_data['password']

    msg = ""
    if not username or not password:
        msg = {"status": {"type": "failure", "message": "Missing Data"}}
        return jsonify(msg)

    user = User.query.filter_by(username=username).first()
    if user is None or not user.check_password(password):
        msg = {"status": {"type": "failure", "message": "Username or password incorrect"}}
    else:
        msg = {"status": {"type": "success",
                          "message": "You logged in"},
               "data": {"user": user.getJsonData()}
               }

    return jsonify(msg)

data = {}
@app.route('/verify', methods=['POST'])
def verify():

    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))

    data['username'] = request_data['username']
    data['name'] = request_data['fullname']
    data['password'] = request_data['password']
    data['number'] = request_data['number']
    data['email'] = request_data['email']

    otp1 = random.randint(100000, 999999)
    otp2 = random.randint(100000, 999999)
    data['otp1'] = otp1
    data['otp2'] = otp2
    msg = ""
    if not data['username'] or not data['name'] or not data['password'] or not data['number'] or not data['email']:
        msg = {"status": {"type": "failure", "message": "missing data"}}
        return jsonify(msg)

    if User.query.filter_by(username=data['username']).count() == 1:
        msg = {"status": {"type": "failure", "message": "username already taken"}}
        return jsonify(msg)
    if User.query.filter_by(email=data['email']).count() == 1:
        msg = {"status": {"type": "failure", "message": "email already taken"}}
        return jsonify(msg)

    if User.query.filter_by(number=data['number']).count() == 1:
        msg = {"status": {"type": "failure", "message": "number already taken"}}
        return jsonify(msg)


    # Your Account Sid and Auth Token from twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = os.environ['AC80945ac6290616dbe73ccabec15aa7f7']
    auth_token = os.environ['ce78106ac13db1ff0bfa6cd3fa26a2aa']
    client = Client(account_sid, auth_token)

    message = client.messages \
        .create(
            body='Your OTP is ' + str(otp1),
            from_='+13153090592',
            to=str(data['number'])
    )
    sg = sendgrid.SendGridAPIClient(api_key='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')
    from_email = Email("xyz.noreply.xyz@gmail.com")
    to_email = To(data['email'])
    subject = "OTP verification for xyz"
    content = Content("Your OTP is "+str(otp2))
    mail = Mail(from_email, to_email, subject, content)
    response = sg.client.mail.send.post(request_body=mail.get())
    msg ={"status": {"type": "success"}}
    return jsonify(msg)

@app.route('/register', methods=['POST'])
def register():
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))
    msg = ""
    otp1 = request_data['otp1']
    otp2 = request_data['otp2']
    if otp1 != data['otp1']:
        msg = {"status": {"type": "failure", "message": "OTP for mobile does not match"}}
        return jsonify(msg)
    elif otp2 != data['otp2']:
        msg = {"status": {"type": "failure", "message": "OTP for email does not match"}}
        return jsonify(msg)
    else:
        u = User()
        u.username = data['username']
        u.name = data['name']
        u.email = data['email']
        u.number = data['number']
        u.set_password(data['password'])


        db.session.add(u)
        db.session.commit()
        data.clear()

        msg = {"status": '{"type": "success", "message": "You have registered"}'}
        return jsonify(msg)