
def tl(x):
    summ = ''
    string = ''
    if (all(isinstance(i, int) for i in x)):
        print "The array you entered is of integer type"
    elif (all(isinstance(i, str) for i in x)):
        print "The array you entered is of string type"
    else:
        print "The array you entered is of mixed type"

    for i in x:
        if type(i) is int:
            summ += i
            print 'Sum:' + str(summ)
        if type(i) is str:
            string += i
            print string



tl(['magical','unicorns'])
