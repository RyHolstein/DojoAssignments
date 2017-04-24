from django.shortcuts import render, redirect
import random, string


# Create your views here.
def index(request):
    word_generated = ''.join([random.choice(string.ascii_letters + string.digits) for n in xrange(14)])
    print word_generated
    word = {
    'word_random': word_generated
    }

    return render(request, 'random_word/index.html', word)

def generate(request):
    request.session['attempt']
    # request.session['attempt'] = 0
    if request.method == 'POST':
        request.session['attempt'] += 1
        print request.session['attempt']
        return redirect('/')
