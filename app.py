from flask import Flask, render_template, send_from_directory
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    return render_template('index.html')  # Fix: Use '.html' for the template file

@app.route('/static/<path:filename>')  # Fix: Add closing bracket for the path parameter
def serve_static(filename):
    root_dir = os.path.dirname(os.path.abspath(__file__))
    return send_from_directory(os.path.join(root_dir, 'static'), filename)

if __name__ == '__main__':
    app.run(debug=True, port=9000)
