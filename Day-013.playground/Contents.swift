import Cocoa

protocol Vehicle{
    var name: String { get } // name must be readable
    var currentPassengers: Int {get set} // must be read or write, so cannot be constant
    
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol CanBeElectric{
    
}

struct Bicycle: Vehicle{
    let name = "Bicycle"
    var currentPassengers =  2
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance) miles.")
    }
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers =  1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Vehicle){
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's slow af! I'll try another vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles{
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) miles")
    }
}

let car = Car()
commute(distance: 100, using:car)


// How to use opaque return types

protocol View { }

func getRandomNumber() -> some Equatable{
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable{
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

// How to create and use extensions

var quote = " The truth is rarely pure and never simple       "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String{
    func trimmed() -> String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim(){
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

print(quote.trimmed())

let lyrics = """
And I know she'll be the death of me
At least we'll both be numb
And she'll alwyas get the best of me
The worst is yet to come
"""

print(lyrics.lines.count)

struct Book{
    let title: String
    let pageCount: Int
    let readingHours: Int

}

extension Book{
    init(title: String, pageCount: Int){
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

// How to create and use protocol extensions

extension Collection{
    var isNotEmpty: Bool{
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]


if guests.isNotEmpty{
    print("Guest count: \(guests.count)")
}

protocol Person{
    var name: String { get }
    
    func sayHello()
}

extension Person{
    func sayHello(){
        print ("Hi, I'm \(name)")
    }
}

struct Employee: Person{
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8
// - Make a protocol that describes a building
// - Your procol should require:
//      - A property storing how many rooms it has
//      - A property storing the cost as an Int
//      - A property sotring the storing the name of the real estate agent
//      - A method printing the sales summary of the building, describing what it is along with its other properties
//
//ref: protocol Vehicle{
//    var name: String { get } // name must be readable
//    var currentPassengers: Int {get set} // must be read or write, so cannot be constant
//    
//    func estimateTime(for distance: Int) -> Int
//    func travel(distance: Int)
//}

protocol Building{
    var rooms: Int {get set}
    var cost: Int {get set}
    var agent: String {get set }
    
    func printSalesSummary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func printSalesSummary() {
        print("House with \(rooms) rooms, costing $\(cost), listed by \(agent)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func printSalesSummary() {
        print("Office with \(rooms) rooms, costing $\(cost), listed by \(agent)")
    }
}
