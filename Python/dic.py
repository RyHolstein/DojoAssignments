 # name, age, country of birth, favorite language

def bio(x):
    for key in x:
        print "My", x[key], "is", key


b = {"name":"Anna", "age":"101", "country of birth":"United States", "favorite language":"Python",}

bio(b)
