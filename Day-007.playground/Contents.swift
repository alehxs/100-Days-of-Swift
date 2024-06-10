import Cocoa

func DRY(){
    print("Call to Do Not Repeat Yourself")
}

DRY()

func printTimesTables(number: Int, end: Int){
    for i in 1...end{
        print("\(i) * \(number) is \(number * i)")
    }
}

printTimesTables(number: 5, end: 20)

//how to return values from functions

let root = sqrt(169)
print(root)

func rollDice() -> Int{
     Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(str1 : String, str2: String) -> Bool{
    str1.sorted() == str2.sorted() // when a func only has 1 line of code you dont need the return
}

areLettersIdentical(str1: "Alan", str2: "Who did you touch last night?")
areLettersIdentical(str1: "alan", str2: "nala")

func pythagoras(a: Double, b: Double) -> Double{
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

func sayHello(){
    return //bald return
}

//how to return multiple values from functions
func getUser() -> (firstName: String, lastName: String) {
    ( "Taylor", "Swift")
}

func getUser2() -> (String,  String) {
    ( "Taylor", "Swift")
}

//print ? if there are no values given


let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

let user2 = getUser2()
print("Name: \(user2.0) \(user.1)")

let(firstName, lastName) = getUser()
print(firstName)

//how to customize parameter labels

func isUppercase(_ string: String) -> Bool{
    string == string.uppercased()
}

let string = "Hello worl!!"
let result2 = isUppercase(string)
print(result2)

//func printTimesTables(number: Int ){
//    for i in 1...12{
//        print("\(i) * \(number) is \(number * i)")
//    }
//}

func printTimesTables2(for number: Int){
    for i in 1...12{
        print("\(i) * \(number) is \(number * i)")
    }
}

printTimesTables2(for: 10)
