from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, 'port/index.html')


def test(request):
    return render(request, 'port/test.html')

def project(request):
    return render(request, 'port/projects.html')


def about(request):
    return render(request, 'port/about.html')
