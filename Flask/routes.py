from flask import Flask, request, jsonify
from app import app, db
from models import *
import json
import os
import random
import smtplib


@app.route("/")
def home():
    return "Home"


@app.route("/login", methods=['POST'])
def login():
    request_data=request.data
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

    global otp1,otp2

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
    print(otp1)
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

    # # mention url 
    # url = "https://www.fast2sms.com/dev/bulk"
    
    
    # # create a dictionary 
    # my_data = { 
    #     # Your default Sender ID 
    #     'sender_id': 'XYZ',  
        
    #     # Put your message here! 
    #     'message': otp1,  
        
    #     'language': 'english', 
    #     'route': 'p', 
        
    #     # You can send sms to multiple numbers 
    #     # separated by comma. 
    #     'numbers': data['number']    
    # } 
    
    # # create a dictionary 
    # headers = { 
    #     'authorization': 'NxMF93WuaXPsTjnDBReCqfUr6GiLH8ck7pA4wblmYSdV5tJyQoaT9gRvXhCox03BFsk2yQMuEVr1bpWL', 
    #     'Content-Type': "application/x-www-form-urlencoded", 
    #     'Cache-Control': "no-cache"
    # }
    # # make a post request 
    # response = requests.request("POST", 
    #                             url, 
    #                             data = my_data, 
    #                             headers = headers) 
    # # load json data from source 
    # returned_msg = json.loads(response.text) 
    
    # # print the send message 
    # print(returned_msg['message'])

    sendEmail(data['email'],otp2)

    msg ={"status": {"type": "success"}}
    return jsonify(msg)
verify={}
@app.route('/forgotpassword',methods=['POST'])
def forgotpassword():
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))
    username = request_data['username']
    msg=""
    verify['username'] = username
    user = User.query().filter_by(username=username).first()
    email = user.email
    if email is not None:
        otp2 = random.randint(100000, 999999)
        verify['otp'] = otp2
        verify['username'] = username
        sendEmail(email,otp2)
        msg={"status": {"type": "success","message":otp2}}
        return jsonify(msg)
    msg = {"status": {"type": "failure", "message": -1}}
    return jsonify(msg)


@app.route('/fp_verify',methods=['POST'])
def forgotpassword_verify():
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))
    msg = ""
    password = request_data['password']
    username = verify['username']
    user = User.query().filter_by(username=username).first()
    user.set_password(password)
    db.session.commit()
    msg={"status": '{"type": "success", "message": "password changed successfully"}'}
    return jsonify(msg)



@app.route('/register', methods=['POST'])
def register():
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))
    msg = ""
    otp1req = request_data['otp1']
    otp2req = request_data['otp2']
    if str(otp1) != str(otp1req):

        msg = {"status": {"type": "failure", "message": "OTP for mobile does not match"}}
    elif str(otp2) != str(otp2req):
        msg = {"status": {"type": "failure", "message": "OTP for email does not match"}}
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


@app.route('/createWorkspace', methods=['POST'])
def createWorkspace():

    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))

    msg = ""

    name = request_data['name']
    admin_username = request_data['admin_username']

    if Workspace.query.filter_by(name=name).count() == 1:
        msg = {"status": {"type": "failure", "message": "Workspace name already taken! Select a new name."}}
    else:
        w = Workspace()
        w.name = name
        w.admin_username = admin_username


        db.session.add(w)
        db.session.commit()
        data.clear()

        msg = {"status": '{"type": "success", "message": "New Workspace created"}'}
    return jsonify(msg)

@app.route('/getWorkspace', methods=['GET'])
def getWorkspace():
    workspaces = Workspace.query.all()

    names=[]
    for workspace in workspaces:
        id = workspace.id
        name = workspace.name
        names.append({"id": id, "name":name})
    return {
        "w": names
   }

def sendEmail(self,email,otp2):
    with smtplib.SMTP('smtp.gmail.com', 587) as smtp:
        smtp.ehlo()
        smtp.starttls()
        smtp.ehlo()

        smtp.login('xyz.noreply.xyz@gmail.com', 'xyz123456789xyz')

        subject = "OTP verification for xyz"
        body = "Your otp is- " + str(otp2)

        msg = f'Subject: {subject}\n\n{body}'

        smtp.sendmail('xyz.noreply.xyz@gmail.com', email, msg)