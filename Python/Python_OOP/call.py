call_list = []


class Call(object):
    def __init__(self, un, name, number, time, reason):
        self.id = un
        self.name = name
        self.number = number
        self.time = time
        self.reason = reason
        call_list.append({"UN": self.id, "name": self.name, "number": self.number, "time": self.time, "reason": self.reason})
    def display(self):
        print "ID:", self.id
        print "Name:", self.name
        print "Number:", self.number
        print "Time:", self.time
        print "Reason:", self.reason


class Center(object):
    def __init__(self):
        pass
    def list(self):
        print call_list
        return self
    def qsize(self):
        print len(call_list)
        return self
    def addcall(self, un, name, number, time, reason):
        Call(un, name, number, time, reason)
        return self
    def removecall(self):
        del call_list[0]
        return self
    def info(self):
        for i in call_list:
            print i['name'], i["number"]
        print len(call_list)


Call(1, "Jordan  M", "44", "2:00 am", "Booty Call")
Call(2, "Jordan  M", "55", "2:00 am", "Booty Call")
Call(3, "Jordan  M", "47", "2:00 am", "Booty Call")
# # cal1.display()
# Center().addcall(4, "Jordan  M", "46", "2:00 am", "Booty Call")
#
#
# Center().list()
Center().info()
