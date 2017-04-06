class User(object):
    def __init__(self, name, email):
        self.name = name
        self.email = email
        self.logged = False


new_user = User("Anna", "anna@anna.com")
print new_user.email
print new_user.name

class User(object):
    def __init__(self, name):
        self.name = name
        self.email = email
        self.logged = True
    def login(self):
        self.logged = True
        print self.name + " is logged in."
        return self
    def logout(self):
        self.logged = False
        print self.name + " is not logged in"
        return self
    def show(self):
        print "My name is {}, and I am a {}. You can email me at {}".format(self.name, self.permission, self.email)
        return self
Copy
