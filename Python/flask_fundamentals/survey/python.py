from flask import Flask, render_template, request, redirect, flash
app = Flask(__name__)
app.secret_key = 'getuamanwhocandoboth'


@app.route('/')
def open():
    return render_template('index.html')


@app.route('/result', methods=['post'])
def create_user():
    name = request.form['name']
    location = request.form['location']
    language = request.form['language']
    comment = request.form['comment']


    if len(request.form['name']) < 1:
        flash('This Name Field cannot be empty!')
        return redirect('/')
    if len(request.form['comment']) < 1:
        flash('This Comment Field cannot be empty!')
        return redirect('/')
    elif len(request.form['comment']) > 150:
        flash('comment can only be 150 characters')
        return redirect('/')
    return render_template('/result.html', name = name, location = location, language = language, comment = comment)




app.run(debug=True)
