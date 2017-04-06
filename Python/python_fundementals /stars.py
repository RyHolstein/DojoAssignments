def mult(arr):
    for i in arr:
        print ('*' * i)


x = [4, 6, 1, 3, 5, 7, 25]
y = mult(x)
print y


def mult(arr):
    for i in arr:
        if type(i) == int:
             print ('*' * i)
        if type(i) == str:
            print (i[0] * len(i))

x = [4, "Tom", 1, "Michael", 5, 7, "Jimmy Smith"]
mult(x)
