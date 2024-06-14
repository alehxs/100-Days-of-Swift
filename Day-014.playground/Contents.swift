import Cocoa

// How to handle missing data with optionals

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peaches"]

if let marioOpposite = opposites["Luigi"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username{
    print("We got user: \(unwrappedName)")
} else{
    print("The optional was empty")
}

var nums1 = 1_000_000
var num2 = 0
var num3: Int? = nil

func square(number: Int) -> Int{
    number * number
}

var number: Int? = nil

if let unwrappedNumber = number{
    print(square(number: unwrappedNumber))
}

// how to unwrap optionals with guard
func printSquare( of number: Int? ){
    guard let number = number else{
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number*number)")
}

var myVar: Int? = 3

if let unwrapped = myVar{
    //only runs if myVar has as value
}
 

//guard let unwrapped2 = myVar else{
//    // only runs if myVar doesn't hve a value inside
//}


//How to unwrapped optionals with nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A" // if empty it will send back n/a

let tvShows = ["The Boys", "The Americans", "Drive to Survive"]
let favorite = tvShows.randomElement() ?? "None"

struct Book{
    let title: String
    let author: String?
}

//let book = Book(title: "Meditations", author: nil)
//let author = book.author ?? "Annonymous"
//print(author)

let input = ""
let number1 = Int(input) ?? 0
print(number1)

// How to handle multiple optionals using optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
// if we have a book, if it has an author, and auth has a first letter in the name uppercase that ho dsfgh
print(author)

// How to handle function failure with optionals

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String{
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23){
    print("User: \(user)")
} //

let user = (try? getUser(id: 23)) ?? "Annonymous"
print(user)

// Checkpoint 9
//  Write a fn that accepts an optional array of ints, returns one of those ints randomly
//  If the array is missing or empty, return a new random number in the random 1 through 100
//  Write function in a single line of code.

func randomInt(from array: [Int]?) -> Int {return array?.randomElement() ?? Int.random(in: 1...100)}

let result1 = randomInt(from: nil)

let result2 = randomInt(from: [])

let result3 = randomInt(from: [10,20,30,40,50])
