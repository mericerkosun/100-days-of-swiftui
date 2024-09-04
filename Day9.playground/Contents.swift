import Cocoa

var exampleClosure = {
    print("Hello, this is a closure.")
}

exampleClosure()

var exClosure : (Int, Int) -> Void = { first, second in
    print(first + second)
}

exClosure(3,5)

var exClosure2 : (Int,Int) -> Void = {
    print($0 + $1)
}

exClosure2(4,2)

var addTwoNumbers : (Int, Int) -> Int = {
    return $0 + $1
}

addTwoNumbers(8,3)

func callYou (name: String, closure: (String) -> Void) {
    print("\(name) will call I")
    closure(name)
    print("\(name) did call I")
}

callYou (name: "Isabella") { name in
        print(name, "is calling you")
}

func greetUser(){
    print("Hello there!")
}

greetUser()
var greetCopy = greetUser
greetCopy()

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

print("****************************************")

// Checkpoint 5
let luckyNumbers = [7,4,38,21,16,15,12,33,31,49]

let filterThem = luckyNumbers.filter({$0 % 2 == 1}).sorted(by: { $0<$1 }).map( {"\($0) is a lucky number" })

for i in filterThem {
    print(i)
}

