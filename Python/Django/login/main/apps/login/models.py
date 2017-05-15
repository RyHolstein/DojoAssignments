from __future__ import unicode_literals

from django.db import models
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
# Create your models here.



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
        if data['password'] < 8:
            errors.append('Password must be at least 8 characters long!')

        if not data['password'] == data['confirm_password']:
            errors.append('password fields have to match')
        print errors
        if len(errors) == 0:
            #add user to the database
            user = User.objects.create(f_name=data['f_name'],l_name=['l_name'], email=data['email'], password=data['password'])
            return {'user': user, 'errors': None}
        else:
            return {'user': None, 'errors': errors}


#Function for logging in
    def login(self, data):
        errors = []
        try:
            User.objects.get(email=data['email'])
            print 'same'
            #email is already registered
        except:
            #email is NOT already registered
            errors.append('Password and Username Combo is incorrect')
            return {'user': None, 'errors':errors }

        if User.objects.get(email=data['email']).password == data['password']:
            user = User.objects.get(email=data['email'])
            return {'user':user, 'errors': None}
        else:
            return {'user': None, 'errors':errors }


class User(models.Model):
    f_name = models.CharField(max_length=100)
    l_name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = UserManager()
