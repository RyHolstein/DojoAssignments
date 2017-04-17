from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector

import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')

app = Flask(__name__)
app.secret_key = 'pleasedontTellpeople'

mysql = MySQLConnector(app,'email_list')

@app.route('/')
def index():
    query = 'SELECT * FROM emails'
    emails = mysql.query_db(query)
    return render_template('index.html')

@app.route('/success')
def success():
    query = 'SELECT * FROM emails'
    emails = mysql.query_db(query)
    return render_template('success.html',  all_emails = emails)


@app.route('/emails', methods=['POST'])
def submit():
    if len(request.form['email']) < 1:
        flash("Email cannot be blank!")

    elif not EMAIL_REGEX.match(request.form['email']):
        flash("Invalid Email Address!")

    else:
        flash('Success!')
        query = "INSERT INTO emails (email, created_at) VALUES (:email, NOW())"
        data = {
                 'email': request.form['email']
                }

        mysql.query_db(query, data)
        return redirect('/success')
    return redirect('/')



app.run(debug=True)
