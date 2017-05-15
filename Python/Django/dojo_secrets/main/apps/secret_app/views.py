from django.shortcuts import render, redirect
from django.contrib import messages
from .models import User, Message, Like
from django.db.models import Count


# Create your views here.
def index(request):
    return render(request, 'secret_app/login_page.html')

def success(request):
    if 'id' not in request.session:
        return redirect('/no_login')
    user_id = request.session['id']


    context = {
    'name': User.objects.get(id=user_id),
    # 'messages': Message.objects.order_by('-id')[:5].annotate(like_num=Count('m_likes')),
    'delete': 'You Posted This',
    'message_list': []
    }

    mc = Message.objects.order_by('-id')[:5].annotate(like_num=Count('m_likes'))

    for x in mc:
        message_context = {
        'message':'',
        'likes': '',
        'created':'',
        'liked': '',
        'id': '',
        }
        message_context['message'] = x.message
        message_context['likes'] = x.like_num
        message_context['id'] = x.id
        if x.user_id.id == request.session['id']:
            message_context['created'] = 'true'
        else:
            message_context['created'] = 'false'


        if_liked = Like.objects.filter(message_id=x.id)

        for x in if_liked:
            if x.user_id.id == request.session['id']:
                message_context['liked'] = 'true'
            else:
                message_context['liked'] = 'false'

        context['message_list'].append(message_context)
    return render(request, 'secret_app/secret_page.html', context)

def no_login(request):
    return render(request, 'secret_app/no_login.html')


def like(request, id):
    if request.method == 'POST':
        data = {
        'u_id': request.session['id'],
        'm_id': id
        }
        Like.objects.liked(data)

    return redirect('/secrets')



def secret_message(request):
    if request.method == "POST":
        message_info = {
            'message': request.POST['message'],
            'id': request.session['id']
            }
        result = Message.objects.post_message(message_info)
        messages.error(request, result, extra_tags='message_error')
        return redirect('/secrets')

def register_account(request):
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
            request.session['id'] = result['user'].id
            return redirect('/secrets')
        else:
            #print errors
            for error in result['errors']:
                # messages.add_message(request, messages.ERROR, extra_tags='register')
                messages.error(request, error, extra_tags='signup')
            return redirect('/')

def login_account(request):
    if request.method == "POST":
        #info from login form
        login_info = {
            'email': request.POST['email'],
            'password': request.POST['password'],
        }
    result = User.objects.login(login_info)

    if result['errors'] == None:
        #if fields match database
        request.session['id'] = result['user'].id
        return redirect('/secrets')
    else:
        #if fields do not match database
        for error in result['errors']:
            messages.error(request, error, extra_tags='login')
        return redirect('/')

def delete_message(request, id):
    if request.method == 'POST':
        Message.objects.delete_message(id)

        return redirect('/secrets')


def logout(request):
    if request.method == 'POST':
        request.session.pop('id')
        return redirect('/')




















##
