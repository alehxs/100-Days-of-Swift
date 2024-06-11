import Cocoa

// How to limit access to internal data using access control

struct BankAccount{
    private(set) var funds = 0 //broke boy!!!
    
    mutating func deposit(_ amount: Int){
        funds += amount
    }
    
    mutating func withdraw(_ amount: Int) -> Bool{
        if funds >= amount{
            funds -= amount
            return true
        } else{
            return false
        }
    }
}

var account = BankAccount()
account.deposit(100)

let success = account.withdraw(200)

if success{
    print("Withdraw successful.")
} else{
    print("Declined. Go get sum money!!")
}

//private - dont let anything outside struct use this

//fileprivate - dont let anything outside current file use this

//public - str8 forward

//private(set) - let anyone read it but only let internal functions write values



// Static properties and methods

struct School{
    static var studentCount = 0
    
    static func add(student: String){
        print("\(student) joined the school."); studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

//diffs:
// self - the current value of a struct 55, "hello", true
// Self - the current type of a struct  Int, String, Bool

struct AppData{
    static let version = "1.3 beta 2"
    static let saveFileName = "settings.json"
    static let homeURL = "https://www.stuff.com/"
}

struct Employee{
    let username: String
    let password: String
    
    static let example = Employee(username: "joe Guanyu", password: "p15 baby!!!")
    // this is only on the struct, not on every individual instance created
}

// Checkpoint 6
// - Create a struct to store information about a car: model, # of seats, current gear
// - Add a method to cahnge gears up or down.
// - Think about variables and access control e.g. Public, private, private(set)
// - Don't allow invalid gears - 1...10 10

struct Car {
    public let model: String
    public let seats: Int
    private(set) var currGear: Int
    
    init(model: String, seats: Int, currGear: Int) {
        self.model = model
        self.seats = seats
        self.currGear = currGear
    }
    
    mutating func changeGear(_ gear: Int) -> Void{
        if gear <= 0 || gear > 10{
            print("Invalid gear")
        } else if currGear == gear{
            print("You are already in that gear!")
        } else{
            currGear = gear
        }
    }
}

var porsche = Car(model: "911 Turbo S", seats: 2, currGear: 2)
porsche.changeGear(5)
print(porsche.currGear)

