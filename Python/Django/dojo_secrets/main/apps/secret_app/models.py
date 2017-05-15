from __future__ import unicode_literals

from django.db import models
import bcrypt

import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
# Create your models here.


class LikeManager(models.Manager):
    def liked(self, data):
        try:
            x = Like.objects.get(user_id=data['u_id'], message_id=data['m_id'])
            return
        except:
            user = User.objects.get(id=data['u_id'])
            message = Message.objects.get(id=data['m_id'])
            Like.objects.create(like=True, user_id=user, message_id=message)
            return

class MessageManager(models.Manager):
#function for posting a message
    def post_message(self, data):

        if data['message'] == '':
            return ('Secret Must not Be Blank')
        else:
            user_id = User.objects.get(id=data['id'])
            message = Message.objects.create(message=data['message'], user_id=user_id)
            return ('Secret Successfully submited')

    def delete_message(self, data):
#function for deleting a post 
        Message.objects.get(id=data).delete()


class UserManager(models.Manager):
#function for registering a new user

    def register(self, data):
        errors = []
        #form validations for firstname field
        if data['f_name'] == '':
            errors.append("Fields must not be Blank")
        elif len(data['f_name']) < 2:
            errors.append('The First Name field must be longer than 2 characters!')
        elif not data['f_name'].isalpha():
            errors.append('The First Name can only be characters!')
        #form validations for last name field
        if data['l_name'] == '':
            errors.append("The Last Name Field must be filled!")
        elif len(data['l_name']) < 2:
            errors.append('The Last Name field must be longer than 2 characters!')
        elif not data['l_name'].isalpha():
            errors.append('The Last Name can only be characters!')
        #form validations for email field
        if data['email'] == '':
            errors.append("Fields must not be Blank")
        if not EMAIL_REGEX.match(data['email']):
            errors.append('Email Must be Correct Format')
        try:
            User.objects.get(email = data['email'])
            errors.append('Email is already being used')
        except:
            pass
        #form validations for password field
        if data['password'] < 1:
            errors.append('Password must be at least 8 characters long!')

        if not data['password'] == data['confirm_password']:
            errors.append('password fields have to match')
        print errors
        if len(errors) == 0:
            #add user to the database
            hashed = bcrypt.hashpw(data['password'].encode('utf-8'), bcrypt.gensalt())
            user = User.objects.create(f_name=data['f_name'],l_name=data['l_name'], email=data['email'], password=hashed)
            return {'user': user, 'errors': None}
        else:
            return {'user': None, 'errors': errors}


#Function for logging in
    def login(self, data):
        errors = []
        try:
            User.objects.get(email=data['email'])
            print 'same user'
            #email is already registered
        except:
            #email is NOT already registered
            print 'different user'
            errors.append('Username is incorrect')
            return {'user': None, 'errors':errors }

        if User.objects.get(email=data['email']).password.encode('utf-8') == bcrypt.hashpw(data['password'].encode('utf-8'), User.objects.get(email=data['email']).password.encode('utf-8')):
            user = User.objects.get(email=data['email'])
            print 'same pass'
            return {'user':user, 'errors': None}
        else:
            print 'different pass'
            errors.append('Pass is incorrect')
            return {'user': None, 'errors':errors }



# Create your models here.
class User(models.Model):
#Users
    f_name = models.CharField(max_length=100)
    l_name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = UserManager()

class Message(models.Model):
#messages
    message = models.TextField(max_length=144)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    user_id = models.ForeignKey(User, related_name='messages')
    objects = MessageManager()

class Like(models.Model):
#likes
    like = models.BooleanField(default=False)
    user_id = models.ForeignKey(User, related_name='likes',on_delete=models.CASCADE)
    message_id = models.ForeignKey(Message, related_name='m_likes', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = LikeManager()
























###
