

def thing(a_dict):
    a_list = []
    for key in a_dict:
        toup = (key, a_dict[key])
        a_list.append(toup)
    return a_list

my_dict = {
"Speros": "(555) 555-5555",
"Michael": "(999) 999-9999",
"Jay": "(777) 777-7777"
}
x = thing(my_dict)
print x
