class Animal(object):
    def __init__(self):
        # self.name = name
        self.health = 100
    def walk(self):
        self.health -= 1
        return self
    def run(self):
        self.health -= 5
        return self
    def display(self):
        print "heath:", self.health
class Dog(Animal):
    def __init__(self, name):
        super(Dog, self).__init__()
        self.name = name
        self.health = 150
    def pet(self):
        self.health += 5
class Dragon(Animal):
    def __init__(self, name):
        super(Dragon, self).__init__()
        self.name = name
        self.health = 170
    def fly(self):
        self.health -= 10
    def display(self):
        print "heath:", self.health, "This is a Dragon!"


dog1 = Dog("skippy")
dragon1 = Dragon('Dave')

dog1.walk().walk().pet()
dog1.display()

dragon1.fly()
dragon1.display()

dog1.fly()
