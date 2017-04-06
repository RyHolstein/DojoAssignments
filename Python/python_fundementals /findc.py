

l = ['hello','world','my','name','is','Anna']
char = set('o')
n = []
for word in l:
    if char & set(word):
        n.append(word)

print n
