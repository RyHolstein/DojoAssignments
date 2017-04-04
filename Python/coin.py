import random
random_num = random.random()

print round(random_num)
h_count = 0
t_count = 0
for i in range (0, 20):
    num = random.random()
    if round(num) == 1:
        h_count += 1
        print "Attempt #", i ,": Throwing a coin... It's a head! ... Got", h_count, "head(s) so far and",t_count,"tail(s) so far"
    if round(num) == 0:
        t_count += 1
        print "Attempt #", i ,": Throwing a coin... It's a tail! ... Got", h_count, "head(s) so far and",t_count,"tail(s) so far"
