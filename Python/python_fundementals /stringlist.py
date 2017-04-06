str = "It's thanksgiving day. It's my birthday,too!"
print str.replace("day", 'month')


x = [2,54,-2,7,12,98]
print max(x)
print min(x)



x = ["hello",2,54,-2,7,12,98,"world"]
print x[0]
print x[-1]


x = [19,2,54,-2,7,12,98,32,10,-3,6]
x.sort();
a = x[:len(x)/2]
b = x[len(x)/2:]
b.insert(0,a)
print b
