import Cocoa

func greetUser(){
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser
greetCopy()

let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
//let sortedTeam = team.sorted()
//print(sortedTeam)
//
//
//let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//})

let sorted = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

let reverseTeam = team.sorted{ $0 >  $1 }

let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)

let uppercaseTeam = team.map {$0.uppercased}
print(uppercaseTeam)

// how to accept functions as parameters

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}


doImportantWork{
    print("This is my first work")
} second:{
    print("This is my second work")
} third:{
    print("This is my third work")
}

//checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// your job is to
// - any #s that are even
// - sort the array in ascending order
// - map them to strings in the format "7 is the lucky number"
// - print the resulting array, one item per line


