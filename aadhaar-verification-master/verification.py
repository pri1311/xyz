from bs4 import BeautifulSoup
from flask import jsonify

def check_exist(response):
    soup = BeautifulSoup(response, 'html.parser')
    tags = soup('h2')
    msg = ""
    if(len(tags)>1):
        status = tags[1].decode()[18:53]
        msg={"status":status}
        return (jsonify(msg))
    else:
        msg={"status":"Invalid CAPTCHA or network error!"}
        return ((jsonify(msg)))