from django.shortcuts import render, redirect, HttpResponse
import random

VALUES = ['one', 'two', 'three', 'four', 'five', 'six', 'seven']
# Create your views here.

def index(request):

    return render(request, "suprise/index.html")





def result(request):
    random.shuffle(VALUES)
    words = []
    num = request.session['num']
    for i in VALUES[:int(num)]:
        words.append(i)

    request.session['items'] = words

    return render(request, 'suprise/result.html')


def something(request):

    if request.method == 'POST':
        request.session['num'] = request.POST['number']

        return redirect('/result')
