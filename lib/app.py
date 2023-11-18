from flask import Flask, request
from twilio.rest import Client

app = Flask(__name__)

# Twilio credentials
# account_sid = 'AC157612dd88c9b68918559b02556cf275'
# auth_token = '22dd8a35a84209968156e8e34ff7128f'
# twilio_number = '+13239634972'

# client = Client(account_sid, auth_token)

@app.route('/make_call', methods=['POST'])
def make_call():
    account_sid = 'AC157612dd88c9b68918559b02556cf275'
    auth_token = '22dd8a35a84209968156e8e34ff7128f'
    twilio_number = '+13239634972'

    client = Client(account_sid, auth_token)

    to_number = '+16475511034'
    try:
        call = client.calls.create(
            to=to_number,
            from_=twilio_number,
            url='http://demo.twilio.com/docs/voice.xml'  # TwiML URL
        )
        return {'message': 'Call initiated', 'call_sid': call.sid}, 200
    except Exception as e:
        return {'error': str(e)}, 500

if __name__ == '__main__':
    app.run(debug=True)
