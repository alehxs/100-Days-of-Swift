import Cocoa

func printTimesTables(for number: Int, end: Int = 12 ) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Jose", "Juan", "Albert"]
print(characters.count)
characters.removeAll(keepingCapacity: true) //
print(characters.count)

//how to handle errors in functions

enum PasswordError: Error{
    case short, obvious
}

func checkPassword(_ password: String) throws -> String{
    if password.count < 5 {throw PasswordError.short}
    if password == "12345" {throw PasswordError.obvious}
    
    if password.count < 8{
        return "OK"
    } else if password.count < 10{
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do{
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch{
    print("There was en error")
}

// checkpoint 4 write a fn that accepts an int form 1 - 10_000 and returns an integer sqrt of that number
enum findSqrtError: Error{
    case outOfBounds, noRoot
}

func findSqrt(_ num: Int) throws -> Int{
    if num < 1 || num > 10_000 {throw findSqrtError.outOfBounds}
    
    for i in 1...100{
        if i * i == num{
            return i
        }
    }
    throw findSqrtError.noRoot
}

do {
    let finalresult = try findSqrt(100000)
    print(finalresult)
} catch findSqrtError.outOfBounds {
    print("Out of bounds")
} catch findSqrtError.noRoot {
    print("No root")
} catch {
    print("Unknown error")
}

//dawg i really need to get dos down
