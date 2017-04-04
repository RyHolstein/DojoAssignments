def make_dict(arr1, arr2):
    keys = arr1
    values = arr2
    new_dict = dict(zip(keys, values))
    print new_dict


name = ["Anna", "Eli", "Pariece", "Brendan", "Amy", "Shane", "Oscar"]
favorite_animal = ["horse", "cat", "spider", "giraffe", "ticks", "dolphins", "llamas"]

make_dict(name, favorite_animal)
