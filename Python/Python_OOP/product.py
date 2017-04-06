class Product(object):
    def __init__(self, price, name, weight, brand):
        self.price = price
        self.name = name
        self.weight = weight
        self.brand = brand
        self.cost = self.price + self.tax()
        self.status = "For Sale"
    def sell(self):
        self.status = "Sold"
        return self
    def tax(self):
        self.tax = self.price * 0.10
        return self.tax
    def returned(self, condition):
        if condition == "opened":
            self.cost = self.cost - (self.cost * 0.22)
            return self.cost
        if condition == "defective":
            self.price = 0
            self.cost = 0
            self.status = "Defective"
            return self
        if condition == "not open":
            return self
    def display(self):
        print "Name:", self.name
        print "Price", self.price
        print "Weight:", self.weight
        print "Brand:", self.brand
        print "Total Cost:", self.cost
        print "Status:", self. status







milk = Product(43, "Milk", "1 gallon", "Dairy")

# milk.returned('')

milk.sell().display()
