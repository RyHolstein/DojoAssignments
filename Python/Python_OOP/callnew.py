class Call(object):
    def __init__(self, a_id, name, phone_number, call_time, call_reason):
        self.id = a_id
        self.name = name
        self.phone_number = phone_number
        self.call_time = call_time
        self.call_reason = call_reason
    def display(self):
        print self.id
        print self.name
        print self.phone_number
        print self.call_time
        return self

class CallCenter(object):
    def __init__(self):
        self.call_list = []
        self.q_size = 0
    def add_call(self, new_call):
        self.call_list.append(new_call)
        self.q_size += 1
    def display(self):
        print self.q_size
    def remove(self):
        if self.q_list  > 0:
            self.call_list.remove(self.call_list[0])
            self.q_size -= 0
    def info(self):
        for call in self.call_list:
            print call.name
            print call.phone_number
        print self.q_size
    def remove_by_number(self, phone_number):
        for call in self.call_list:
            if phone_number == call.phone_number:
                self.call_list.remove(call)
                self.q_size -= 1
                return self
        return self 



x = Call(342, 'Ryan', '243324', "2pm", "Say Hello")

y= CallCenter()

y.add_call(x)

y.remove_by_number('243324')

y.info()
