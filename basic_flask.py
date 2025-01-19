from flask import Flask
from gevent.pywsgi import WSGIServer
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def hello():
    return {
        'message': 'Hello, Flask... This is Pascal!!!',
        'timestamp': datetime.now().isoformat()
    }

if __name__ == '__main__':
    # #Debug/Development
    # app.run(host='0.0.0.0', port=5000)
    # Production
    http_server = WSGIServer(('', 5000), app)
    http_server.serve_forever()
