import random

for i in range (0, 11):
    num = (random.randint(60, 100))
    if num >= 90:
        print "Score:", num, "Your grade is a A"
    elif num >= 80:
        print "Score:", num, "Your grade is a B"
    elif num >= 70:
        print "Score:", num, "Your grade is a C"
    elif num >= 60:
        print "Score:", num, "Your grade is a D"
