from werkzeug.security import generate_password_hash, check_password_hash
from app import db

class User(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), index=True)
    username = db.Column(db.String(80), index=True, unique=True)
    email = db.Column(db.String(80), index=True, unique=True)
    number = db.Column(db.String(10), index=True, unique=True)
    workspace = db.Column(db.String(255), index=True, unique=True)

    password_hash = db.Column(db.String(128))

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

    def getJsonData(self):
        return {
            "username": self.username,
            "name": self.name,
            "email": self.email,
        }


class Workspace(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), index=True)
    admin_username = db.Column(db.String(80), index=True)
    channellist = db.Column(db.String(255), index=True)

    def addChannel(self, newChannel):
        self.channellist+=(" "+ newChannel)

    def getChannellist(self):
        channelstring= self.channellist
        channels=channelstring.split()
        return{
            "channellist": channels,
        }


    def getJsonData(self):
        return {
            "id": self.id,
            "name": self.name,
            "admin_username": self.admin_username,
            "channellist": self.channellist,
        }

