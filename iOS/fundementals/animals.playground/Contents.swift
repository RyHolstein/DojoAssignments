//: Playground - noun: a place where people can play

import UIKit

class Animal {
    var name: String
    var health = 100
    init(name:String) {
        self.name = name
    }
    func displayHealth() {
        print("My health is", self.health)
    }


}// end Animal class




class Cat: Animal {
    init(catName: String) {
        super.init(name: catName)
        self.health = 150
        print(self.name)
    }
    
    
    
    func growl() {
        print("Rawr!!!!")
    }
    func run(){
        self.health = self.health - 10
        print("\(name) is running")
        
    }
}//end Cat




class Cheetah: Cat {
    init(cheetahName: String) {
        super.init(catName:cheetahName)
    }
    override func run() {
        self.health = self.health - 50
        print("Running Fast!!!")
    }
    func sleep(){
        if self.health >= 200 {
            print("Cheetah cannot Run its already at max health")
        }
        else{
            self.health = self.health + 50
        }
    }


}//end Cheetah



class Lion: Cat {
    init(lionName: String){
        super.init(catName: lionName)
        self.health = 200
    }
    func roar(){
        print("ROAR!!! I am King of The Jungle")
    }
}//end lion

//*******************tests***************
//var myAnimal: Animal = Animal(name:"Cat")


//Cheetah
var myCheetah: Cheetah = Cheetah(cheetahName:"Chester")
myCheetah.displayHealth()
myCheetah.run()
myCheetah.displayHealth()
myCheetah.sleep()
myCheetah.displayHealth()
myCheetah.sleep()
myCheetah.displayHealth()
myCheetah.sleep()
myCheetah.displayHealth()


//Lion
var myLion: Lion = Lion(lionName:"Simba")
myLion.displayHealth()
myLion.run()
myLion.run()
myLion.run()
myLion.roar()
myLion.displayHealth()

//end