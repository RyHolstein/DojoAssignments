class MathDojo(object):
    def __init__(self):
        self.result = 0
    def add(self, num1, *num2):
        self.result = self.result + num1 + num2
        return self
    def sub(self, num1, *num2):
        self.result = self.result - (self.num1 + self.num2)
        return self


MathDojo().result


# MathDojo().add(2).add(2, 5).subtract(3, 2).result
