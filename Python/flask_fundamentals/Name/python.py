from flask import Flask, render_template
app = Flask(__name__)


@app.route('/')
def open():
    return render_template('index.html')





@app.route('/process', methods=['POST'])
def create_user():
   print name
   name = request.form['name']
   return redirect('/')





app.run(debug=True)
