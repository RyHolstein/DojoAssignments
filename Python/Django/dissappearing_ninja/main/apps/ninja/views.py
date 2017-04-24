from django.shortcuts import render, redirect

# Create your views here.

def index(request):
    who = "No ninjas here"
    return render(request, 'ninja/index.html', {"who":who})


def ninja(request):
    url = "/static/ninja/assets/tmnt.png"
    return render(request, 'ninja/index.html', {"url":url})

def show(request, color):
    if color == 'red':
        url = "/static/ninja/assets/raphael.jpg"
    elif color == 'orange':
        url = '/static/ninja/assets/michelangelo.jpg'
    elif color == 'blue':
        url = '/static/ninja/assets/leonardo.jpg'
    elif color == 'purple':
        url = '/static/ninja/assets/donatello.jpg'
    else:
        url = '/static/ninja/assets/april.jpeg'

    # if color == 'red'
    return render(request, 'ninja/index.html', {"url":url})
