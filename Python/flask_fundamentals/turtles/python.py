from flask import Flask, render_template, request, redirect
app = Flask(__name__)


@app.route('/')
def sewer():
    return render_template("index.html")

@app.route('/ninjas')
def unite():
    color = "static/tmnt.png"
    return render_template("ninjas.html" , color = color)

@app.route('/ninjas/<who>')
def ninja(who):
    if who == 'red':
        color = "/static/raphael.jpg"
    elif who == 'blue':
        color = "/static/leonardo.jpg"
    elif who == 'purple':
        color = "/static/donatello.jpg"
    elif who == 'orange':
        color = "/static/michelangelo.jpg"
    else:
         color = "/static/notapril.jpg"

    return render_template("ninjas.html" , color = color)


)


app.run(debug=True)
