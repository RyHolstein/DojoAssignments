from flask import Flask, render_template, request, redirect, session
app = Flask(__name__)
app.secret_key = 'password'
from time import ctime
import random
import datetime

@app.route('/')
def home():
    if 'coins'  not in session:
        session['coins'] = 0


    if 'log' not in session:
        session['log'] = ''
    gold_num = session['coins']
    return render_template('index.html', gold_num = gold_num)


@app.route('/process_money', methods=['post'])
def game():
    gold_num = session['coins']
    farm_gold =  random.randrange(10, 21)
    cave_gold = random.randrange(5, 11)
    house_gold = random.randrange(2, 6)
    casino_gold = random.randrange(-50, 51)
    time = ctime()

    if request.form['building'] == 'farm':
        session['coins'] += farm_gold
        session['log'] += '<p class="winner"> You started Farming and earned ' + str(farm_gold) + ' at ' + time + '</p>'

    elif request.form['building'] == 'cave':
        session['coins'] += cave_gold
        session['log'] += '<p class="winner"> You entered a Cave and won ' + str(cave_gold) + ' at ' + time + '</p>'

    elif request.form['building'] == 'house':
        session['coins'] += house_gold
        session['log'] += '<p class="winner"> You Robbed a house and stole ' + str(house_gold) + ' at ' + time + '</p>'


    elif request.form['building'] == 'casino':
        session['coins'] += casino_gold
        if casino_gold > 0:
            session['log'] += '<p class="winner"> You entered a Casino and won ' + str(casino_gold) + ' at ' + time + '</p>'
        else:
            session['log'] += '<p class="loser"> You entered a Casino and Lost ' + str(cave_gold) + ' at ' + time + '</p>'


    return redirect('/')

app.run(debug=True)
