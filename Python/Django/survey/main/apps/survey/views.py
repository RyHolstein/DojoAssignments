from django.shortcuts import render, redirect, HttpResponse, redirect

# Create your views here.
def index(request):
    return render(request, 'survey/index.html')


def survey(request):
    name = request.session['name'],
    # name.encode('ascii', 'ignore'),
    # location = request.session['location'],
    # language =
    # info = {
    #     "name": request.session['name'],
    #     "location": request.session['location'],
    #     "language": request.session['language'],
    #     "comment": request.session['comment']
    # }
    print name
    return render


def success(request):
    if request.method == 'POST':
        request.session['name'] = request.POST['name'],
        request.session['location'] = request.POST['location'],
        request.session['language'] = request.POST['language'],
        request.session['comment'] = request.POST['comment'],
        print request.session['location']
        return redirect('/result')


# "name": request.POST['name'],
# "location": request.POST['location'],
# "language": request.POST['language',
# "comment": request.POST['comment'],
