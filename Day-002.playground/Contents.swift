import Cocoa

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)

isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver = false
gameOver.toggle() //same as !


let firstPart = "operator"
let secondPart = "overloading"
let whole = firstPart + secondPart

let quote = "Then \"After\" away"

let name = "Paul"
let age = 46
let message = "Hello, my name is \(name) and I'm \(age) years old."


//Checkpoint 1

let temperature = 22

print("\(temperature)ºC in fahrenheit is \(temperature * 9 / 5 + 32)ºF")
