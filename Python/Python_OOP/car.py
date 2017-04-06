class Car(object):
    def __init__(self, price, speed, fuel, mileage):
        self.price = price
        self.speed = speed
        self.fuel = fuel
        self.mileage = mileage
        self.tax = self.tax()
    def tax(self):
        if self.price > 10000:
            self.tax = 0.15
        else:
            self.tax = 0.12
        return self.tax
    def display(self):
        print "Price:", self.price
        print "Speed:", self.speed
        print "Fuel:", self.fuel
        print "Mileage:",self.mileage
        print "Tax:", self.tax



            # if self.price > 10000:
            #     print "Tax: 0.15"
            # else:
            #     print "Tax: 0.12"

car1 = Car(20000, "45mph", "Full", "15mph")

car1.display()
