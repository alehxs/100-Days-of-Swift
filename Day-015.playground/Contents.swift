import Cocoa

// Going over unknown topics

// dictionaries
let employee = [
    "name" : "superman",
    "job" : "hero"
]

print(employee["job", default: "no se"])

//sets

var numbers =  Set([1,1,1,1,1, 3, 5, 1, 29])
print(numbers)

numbers.insert(100)
numbers.contains(29)
print(numbers) // sets do not contain duplicates

// enums

enum Weekday{
    case Monday, Tuesday, Wednesday, Thursday, Friday
}

var day = Weekday.Friday
day = .Monday
print(day)

// Switches

enum Weather{
    case sun, rain, wind
}

let forecast = Weather.rain

switch forecast{
case .sun:
    print("It's hot af")
case .wind:
    print("Watch your 4head")
case .rain:
    print("Bring your umbrella")
}

// ternary conditional operator

let age = 18
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)

// returning multiple values from fns

func getUser() -> (firstName: String, lastName: String){
    (firstName: "Taylor", lastName: "Swift")
}
let (firstName, _) = getUser()
print("Name: \(firstName)")

// Handling errors in functions

enum PasswordError: Error{
    case short, obvious
}

func checkPassword(_ password: String) throws -> String{
    if password.count  < 5 {
        throw PasswordError.short
    }
    
    if password == "12345"{
        throw PasswordError.obvious
    }
    
    if password.count < 10{
        return "OK"
    } else{
        return "Good"
    }
}

do{
    let result = try checkPassword("12345")
    print("rating: \(result)")
} catch PasswordError.obvious{
    print("My grandma can make a better password than that")
} catch {
    print("There was an error")
}

// closures

let sayHello = { (name: String) -> String in
    "Hi, \(name)!"
}

print(sayHello("Bob"))

let team = ["Jisoo" , "Jennie", "Rose", "Lisa"]

//let onlyJ = team.filter({ (name: String) -> Bool in
//                        return name.hasPrefix("J")})

let onlyJ = team.filter{ $0.hasPrefix("J")}
print(onlyJ)

//  computed properties
struct Employee{
    let name: String
    var vacationAllowed = 10
    var vacationTaken = 0
    
    var vacationRemaining: Int{
        get{
            vacationAllowed - vacationTaken // calculated dyanamically everytime vacationRemaining is called
        }
        set{
            vacationAllowed = vacationTaken + newValue
        }
        

    }
}

//property observers

struct Game{
    var score = 0 {
        didSet{
            print("The score is now \(score)!")
        }
    }
}

var game = Game()
game.score += 10
game.score += 6

// Custom Initalizers
struct Player{
    let name: String
    let number: Int
    
    init(name: String){
        self.name = name
        self.number = Int.random(in: 0...99)
    }
}

let player1 = Player(name: "Jose")
print(player1.number)

// access control

//public

//private

//private(set)

//  Static properties and methods

struct AppData{
    static let version = "1.1"
    static let engine = "naturally apspirated flat 6"
}

print("The engine being used is \(AppData.engine)!")

// Protocols

//basic outline:
protocol motorizedVehicle{
    var model : String {get}
    var engine: String {get}
    var cylinders: Int {get}
    
    func printSpecs(model: String, engine: String, cylinders: Int)
}

//  extensions

extension String{
    func trimmed() -> String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim(){ // if you want to change the value directly in the method instead of a new value
        self = self.trimmed()
    }
}

var quote = "                   And I know she'll be the death of me         "
quote.trim()
print(quote)

//protcol extensions

let opposites = [
    "Mario" : "Luigi",
    "Fire" : "Water"
]

let opposite = opposites["Appa"]

if let marioOpposite = opposites["Mario"]{
    print("Mario's opposite is \(marioOpposite)")
}

//optionals

func printSquare(of number: Int?){
    guard let number = number else{
        print("Missing input"); return
    }
    
    print("\(number) x \(number) = \(number * number)")
}

printSquare(of: 2)

// nil coalescing

let tvShows = ["Atla", "The Boys"]
let favorite = tvShows.randomElement() ?? "None"
print(favorite)

// optional chaining

let names = ["arya", "brian", "juan"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "no one")")

//optional try

enum UserError: Error{
    case badID, networkFailure
}

func getUser(id: Int) throws -> String{
    throw UserError.networkFailure
}

if let user = try? getUser(id: 10){
    print("User: \(user)")
}

