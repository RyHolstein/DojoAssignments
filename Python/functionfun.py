def oe():
    for i in range(1, 2001):
        if i % 2 != 0:
            print "Number is", i, ". This is a odd number."
        else:
            print "Number is", i, ". This is even number."

oe()

def multiply(arr,num):
    for x in range(len(arr)):
        arr[x] *= num
    return arr
a = [2,4,10,16]
b = multiply(a,5)
print b

def layered_multiples(arr):
    new_array = []
    for i in arr:
        new_array.append(['1' * i])
    return new_array

x = layered_multiples(multiply([2,4,5],3))
print x
