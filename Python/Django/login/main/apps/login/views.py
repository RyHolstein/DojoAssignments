from django.shortcuts import render, redirect
from django.contrib import messages
from .models import User
# Create your views here.
def index(request):
    return render(request, 'login/index.html')

def success(request):
    context = {
        'user_name': request.session['f_name']
    }


    return render(request, 'login/success.html', context)


def register(request):
    if request.method == 'POST':
        #info from Register form
        post_info = {
            'f_name': request.POST['f_name'],
            'l_name': request.POST['l_name'],
            'email': request.POST['email'],
            'password': request.POST['password'],
            'confirm_password': request.POST['confirm_password'],
        }
        result = User.objects.register(post_info)

        if result['errors'] == None:
            print result['user']
            request.session['f_name'] = result['user'].f_name
            return redirect('/success')
        else:
            #print errors
            for error in result['errors']:
                # messages.add_message(request, messages.ERROR, extra_tags='register')
                messages.error(request, error, extra_tags='signup')
            return redirect('/')

def login(request):
    if request.method == "POST":
        #info from login form
        login_info = {
            'email': request.POST['email'],
            'password': request.POST['password'],
        }
    result = User.objects.login(login_info)

    if result['errors'] == None:
        #if fields match database
        request.session['f_name'] = result['user'].f_name
        return redirect('/success')
    else:
        #if fields do not match database
        for error in result['errors']:
            messages.error(request, error, extra_tags='login')
        return redirect('/')




















#end
