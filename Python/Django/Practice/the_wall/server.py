from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
import bcrypt

import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')

app = Flask(__name__)
app.secret_key = 'pleasedontTellpeople'

mysql = MySQLConnector(app,'theWall')

@app.route('/')
def register():
    query = 'SELECT * FROM users'
    all_users = mysql.query_db(query)
    return render_template('index.html')
@app.route('/wall')
def wall():
    return render_template('wall.html')
@app.route('/register', methods=['POST'])
def submit():

    first_name = request.form['first_name']
    last_name = request.form['last_name']
    password = request.form['password']
    email = request.form['email']
    query = 'SELECT * FROM users'
    all_users = mysql.query_db(query)

    for user in all_users:
        if user['email'] == email:
            flash('Email Already Exits')
            return redirect('/')


    if len(first_name) < 1 or len(last_name) < 1 or len(request.form['password']) < 1:
        flash("Fields cannot be blank!")
    elif not EMAIL_REGEX.match(email):
        flash("Invalid Email Address!")
    elif request.form['password'] != request.form['confirm']:
        flash('Password Fields do not match!!')

    else:
        query = "INSERT INTO users (first_name, last_name, email, password, created_at, updated_at) VALUES (:first_name, :last_name, :email, :password, NOW(), NOW())"
        data = {
                'first_name': first_name,
                'last_name': last_name,
                'email': email,
                'password': password
                # bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()),
                }
        mysql.query_db(query, data)
        # return redirect('/wall')

    return redirect('/')



@app.route('/login', methods= ['POST'])
def login():
    email = request.form['email']
    password = request.form['password']


    query = 'SELECT * FROM users'
    all_users = mysql.query_db(query)
    for user in all_users:
        if user['email'] == email and user['password'] == password:
            print ('success')
            return redirect('/wall')
        else:
            flash('failed')


    return redirect('/')







# @app.route('/wall_post', methods=['POST'])
# def wallpost():
#     message = request.form['message']
#     query = "INSERT INTO messages (message, created_at, updated_at) VALUES (:message, NOW(), NOW())"
#     data = {
#             'message': message,
#             }
#     mysql.query_db(query, data)
#     return redirect('/wall')
#
#     return redirect('/')

app.run(debug=True)
