import Cocoa

var greeting = "Hello, playground"
//var can change over time

let character = "aang"
//this is a constant

//how to create multiline string
let movie = """
A day in the life
of a Beekeeper
"""

//how to get length of string
print(character.count)

//print uppercase
print(character.uppercased())

print(character.hasPrefix("aa"))

let score = 10
let reallyBigNum = 100_000_000

let lowerScore = score - 1
let higherScore = score + 2

let doubleScore = score * 2
let squaredSore = score * score
let halvedScore = score / 2

var counter = 10

counter += 1
counter -= 10
counter /= 2

let number = 120
print(number.isMultiple(of: 2))


let num = 0.1 + 0.2
print(num)


