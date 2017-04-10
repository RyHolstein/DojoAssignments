from flask import Flask, render_template, request, redirect, session
app = Flask(__name__)
app.secret_key = 'password'

import random


@app.route('/')
def home():
    if 'random'  not in session:
        session['random'] = random.randrange(0, 101)


    print session['random']
    display_form = "display"
    redo = 'none'
    return render_template('game.html', display_form = display_form, redo = redo)

@app.route('/', methods=['post'])
def game():
   number_input = request.form['number_input']
   print number_input
   if session['random'] == int(number_input):
       result = "WINNER"
       form = 'none'
       session.pop('random')
       redo = 'show'
       return render_template('game.html', form = form, result = result, redo = redo)
   else:
       result = "LOSER"
       redo = 'none'
       return render_template('game.html', result = result, redo = redo)


   return render_template("game.html", number_input = number_input, result = result)


app.run(debug=True)
