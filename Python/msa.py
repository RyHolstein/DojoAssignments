for count in range (0, 1000):
    if count%2 == 1:
        print count
    else:
        continue

for count in range (5, 1000000):
    if count%5 == 0:
        print count
    else:
        continue


a = [1, 2, 5, 10, 255, 3]
print sum(a)


a = [1, 2, 5, 10, 255, 3]
mean = sum(a) / len(a)
print mean
