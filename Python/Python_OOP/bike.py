class Bikes(object):
    def __init__(self, price, maxspeed):
        self.price = price
        self.maxspeed = maxspeed
        self.miles = 0
    def display(self):
        print "price:", self.price
        print "Max Speed", self.maxspeed
        print "Miles:", self.miles
    def ride(self):
        print "Riding"
        self.miles += 10
        return self
    def reverse(self):
        print "Reversing"
        self.miles -= 5
        return self


bike1 = Bikes(200, '25mph')

bike1.ride().ride().ride().reverse().display()

bike1.ride().ride().reverse().reverse().display()

bike1.reverse().reverse().reverse().display()
