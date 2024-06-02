import Cocoa

//type annotations
let lastname: String = "Stark"
var score: Double = 0

let playerName: String = "Roy"
let luckyNum: Int = 5
let pi = 3.14157
var isAuth: Bool = true

var albums: [String] = ["Red", "Starboy"]
var user: [String: String] = ["id" : "@tacoman"] // dictionary
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Jon Jones"
])

var sode: [String] = ["Coke", "Pepsi"]

//create an empty array
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle{
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

let username: String
// complex leogi
username = "@twostraws"
print(username)

// Checkpoint TWOOOOOOO: Create an array of strings , then print the # of items in the array and # of unique items in the array.
let arr: [Int] = [1, 5, 200, 200, 200, 365, 404, 506]
var uniqueVals = Set<Int>(arr)

print("Number of items: \(arr.count)")
print("Number of unique items: \(uniqueVals.count)")

