class MathDojo(object):
    def __init__(self):
        self.result = 0



    def add(self, *nums):
        for i in nums:
            total = 0
            if isinstance(i, list):
                for j in i:
                    total += j
                self.result += total
            elif isinstance(i, tuple):
                for j in i:
                    total += j
                self.result += total
            else:
                self.result += i
        return self



    def sub(self, *nums):
        for i in nums:
            total = 0
            if isinstance(i, list):
                for j in i:
                    total += j
                self.result -= total
            elif isinstance(i, tuple):
                for j in i:
                    total += j
                self.result -= total
            else:
                self.result -= i
        return self

    def display(self):
        print self.result



x = MathDojo()
#
# x.add(2).add(2, 5).sub(3, 2)
#
x.add(1,(3,4)).add([3, 5, 7, 8], (2, 4.3), 1.25).sub(2, [2,3], [1.1, 2.3])

x.display()
