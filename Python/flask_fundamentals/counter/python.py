from flask import Flask, render_template, request, redirect, session
app = Flask(__name__)
app.secret_key = 'password'


@app.route('/')
def game():
    if 'number' in session:
        session['number'] += 1
    else:
        session['number'] = 0
    return render_template("index.html", number = session['number'])

@app.route('/', methods=['post'])
def reset():
    # session.pop()
    return render_templates('/')





app.run(debug=True)
