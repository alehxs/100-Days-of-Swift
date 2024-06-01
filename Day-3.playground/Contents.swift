import Cocoa

var elmts = ["Earth", "Water", "Fire", "Air"]
let nums = [4,8,15]
let temps = [70.5, 108.4, 90.5]

elmts.append("Electricity")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)

print(scores)

//var albums = Array<String>()
var albums = [String]() //this does the same thing as line b4
albums.append("After Hours")
albums.append("Alone at Prom")
print(albums)
print("Album count: \(albums.count)")

var chars = ["Aang", "Appa", "Momo"]
chars.remove(at: 2)
print(chars.count)

chars.removeAll()
print(chars.count)

let goats = ["Messi", "Keanu Reeves", "Mr. Rogers"]
print(goats.contains("Dwanye Johnson"))

let cities = ["London" , "Tokyo", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obamna", "Soda"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

//this gives an actual reversed Array
let actuallyReversed = Array(presidents.reversed())
print(actuallyReversed)
