import Cocoa

// Create your own structs

struct Album{
    let title: String
    let artist: String
    let year: Int
    
    func printSummary(){
        print("\(title) (\(year)) by \(artist)")
    }
}

let starboy = Album(title: "Starboy", artist: "The Weeknd", year: 2016)
starboy.printSummary()

//struct Employee{
//    let name: String
//    var VacationRemaining: Int
//    
//    // "mutating" enables the function to write to values
//    mutating func takeVacation(days: Int){
//        if VacationRemaining > days{
//            VacationRemaining -= days
//            print("I am going on vacation!")
//            print("Days remaining: \(VacationRemaining)")
//        } else{
//            print("Oops, you got no PTO sir")
//        }
//    }
//}



//var archer = Employee(name: "Sterling Archer", VacationRemaining: 14)
//archer.takeVacation(days: 5)
//print(archer.VacationRemaining)

//  How to compute property values dynamically
struct Employee{
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get{
            vacationAllocated - vacationTaken
        }
        
        set{
            vacationAllocated = vacationTaken + newValue
        }
        
    }
}

var totoro = Employee(name: "Big Totoro", vacationAllocated: 14)
totoro.vacationTaken += 4
totoro.vacationRemaining = 5
print(totoro.vacationAllocated)

//  How to take action when a property changes

struct Game{
    var score = 0{
        didSet{     //this prints whenever the score value is mutated
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 19
game.score -= 3
game.score += 1

struct App{
    var contacts = [String](){
        willSet{    // used less often comapared to didSet
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)\n")
        }
        
        didSet{
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)\n")
        }
    }
}
var app = App()

app.contacts.append("Jose")
app.contacts.append("Vivan")
app.contacts.append("Mohammed")

//  How to create custom initalizers
struct Player {
    let name: String
    let number: Int
    
    //  Constructor
    init(name: String){
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Toby R")
print(player.number)
