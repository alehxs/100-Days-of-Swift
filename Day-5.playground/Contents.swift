import Cocoa

var greeting = "Hello, playground"

let someCondition = true

if someCondition{
    print("True")
}

let score = 85

if score < 90{
    "Great Job"
}

let ourName = "Lisa"
let herName = "Jennie"

if ourName > herName {
    print("It's \(ourName) vs \(herName)")
}

var nums = [1,2,3]
nums.append(4)

if nums.count > 3
{nums.remove(at: 0)}

// switch statements
enum Weather{
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.snow

switch forecast{
case .sun:
    print("It's gonna be hot af")
case .rain:
    print("Hope you got an umbrella")
case .wind:
    print("Watch your hair")
case .snow:
    print("School is cancelled")
case .unknown:
    print("No sabo")
}
let place = "Don Ramon"

switch place{
case "Gotham":
    print("You're Batman!")
case "Stark Tower":
    print("You're Ironman!")
case "Barrel":
    print("Eres el chavo del 8!")
default:
    print("Who tf is Coco?")
}

//if you want swift to run other cases then you use fallthrough

let day = 5
print("My true love gave to me...")

switch day{
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("5 calling birds")
    fallthrough
case 3:
    print("3 french hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

//ternary operator
let age = 18
let canVote = age >= 18 ? "yes" : "no"
//              what?      true     false
print(canVote)

let hour = 23

print(hour > 12 ? "it's before noon" : "it's after noon")

let names = ["jose"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"

