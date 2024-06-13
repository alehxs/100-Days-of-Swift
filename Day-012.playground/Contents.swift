import Cocoa

// How to create your own classes

class Game {
    var score = 0{
        didSet{
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

//  How to make one class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary(){
        print("I work \(hours) a day.")
    }
}

final class Developer: Employee { //final means the class can inherit, but other classes cannot inherit from it. So basically a selfish arrogant hypocrite class with narcissistic tendencies (joke)
    func work(){
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary(){           //how to override parent function
        print("I'm Mr.305. Mr. Worldwide.")
    }
        
}

class Manager : Employee {
    func work(){
        print("I am going to meetins for \(hours) hours.")
    }
}

let venkat = Developer(hours: 8)
let alan = Manager(hours: 2)


venkat.work()
alan.work()

//  How to add initializers for classes

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let porsche = Car(isElectric: false, isConvertible: false)

//  How to copy classes
//  all copies of a class instances points to the same data
//  although, that is not the case for structs

class User {
    var username = "Annonymous"
    
    func copy() -> User{
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()


user2.username = "Abel"

print(user1.username)
print(user2.username)

// How to create a deinitializer for a class
// - you dont use func
// - never take parameters
// - automatically called when last copy of class is destroyed
// - structs dont have deinitializers since they dont have copies

class User2{
    let id: Int
    
    init( id: Int){
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): me muri.\n")
    }
}
var users = [User2]()

for i in 1...3{
    let user = User2(id: i)
    print("User \(user.id): i'm alive af")
    users.append(user)
}

print("Loop is finished")
users.removeAll()
print("Array is cleared!")

// How to work with variables inside classes

class User3{
    var name = "Paul"
}

//let user = User3()
//user.name = "John"
//print(user.name)

var user4 = User3()
user4.name = "taylor"
user4 = User3()
print(user4.name)

// Checkpoint 7:

// Class hierarchy for animals
// Animal class with legs property
// Dog and Cat subclasses of Animal
// Corgi and Poodle subclasses of Dog
// Persian and Lion subclasses of Cat
// Dog and Cat have speak() methods with unique outputs
// Cat class has an isTame Boolean property set via initializer

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("woof! I have \(legs) legs.")
    }
}

class Corgi: Dog {
    override func speak() {
        print("woof! I am a corgi and I have \(legs) legs.")
    }
}

class Poodle: Dog {
    override func speak() {
        print("I do not woof, I am a dog of class and I have \(legs) legs.")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("I am a cat and I have \(legs) legs.")
    }
}

class Persian: Cat {
    override func speak() {
        print("I am a Persian house cat and I have \(legs) legs.")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar! I am a lion and I have \(legs) legs.")
    }
}

let corgi = Corgi(legs: 3)
corgi.speak()

let poodle = Poodle(legs: 4)
poodle.speak()

let persian = Persian(legs: 5, isTame: true)
persian.speak()

let lion = Lion(legs: 4, isTame: false)
lion.speak()
