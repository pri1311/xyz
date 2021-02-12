from flask import Flask, request, jsonify
import mechanize, verification
import json

from PIL import Image
from io import BytesIO

app = Flask(__name__)
br = mechanize.Browser()
msg=""
@app.route('/')
def hello_world():
    global br
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))

    uidno = request_data['uidno']

    br.addheaders = [('User-agent', 'Firefox')]

    br.set_handle_robots(False)  # ignore robots
    br.set_handle_refresh(False)  # can sometimes hang without this

    response = br.open("https://resident.uidai.gov.in/CaptchaSecurityImages.php?width=100&height=40&characters=5")

    img = Image.open(BytesIO(response.read()))
    msg ={"img": img, "uidno":uidno}
    return (msg)

@app.route('/verify')
def verify():
    global br
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))
    security_code = request_data['security_code']
    uidno = request_data['uidno']
    # populating the fields in the form
    br.open('https://resident.uidai.gov.in/verify')
    br.select_form('verifyform')
    br.form['uidno'] = uidno
    br.form['security_code'] = security_code
    response = br.submit().read()
    msg = verification.check_exist(response)
    return (msg)


if __name__ == '__main__':

    app.run()


