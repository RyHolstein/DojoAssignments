class Patient(object):
    def __init__ (self, a_id, name, allergies):
        self.id = a_id
        self.name = name
        self.allergies = allergies
        self.bed_number = "none"



class Hospital(object):
    def __init__ (self, name, capacity):
        self.name = name
        self.capacity = capacity
        self.patients = []
    def admit(self, new_patient, bed_number):




h1 = Hospital('St Jude', 10)
p1 = Patient(1, 'John', 'nuts')
p2 = Patient(2, 'Ryan', 'whip cream')
p3 = Patient(3, 'Fred', 'candy')
