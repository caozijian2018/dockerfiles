from flask import Flask
app = Flask(__name__)
@app.route('/')
def gethead():
    return "hello docker"