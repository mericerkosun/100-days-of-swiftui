import Cocoa

var range : ClosedRange = 0...10
print(range.first!)
print(range.last!)

var speeds = (65,34,57)

// LABELED STATEMENTS

for i in 1...5 {
    for j in 1...5 {
        if i == 3 && j == 3 {
            break
        }
        print("i: \(i), j: \(j)")
    }
}

print("---------------")

outerLoop: for i in 1...5 {
    for j in 1...5 {
        if i == 3 && j == 3 {
            break outerLoop
        }
        print("i: \(i), j: \(j)")
    }
}

print("---------------")

for i in 1...5 {
    outerLoop: for j in 1...5 {
        if i == 3 && j == 3 {
            break outerLoop
        }
        print("i: \(i), j: \(j)")
    }
}

// loop from 1 through 100, and for each number:
// If it’s a multiple of 3, print “Fizz”
// If it’s a multiple of 5, print “Buzz”
// If it’s a multiple of 3 and 5, print “FizzBuzz”
// Otherwise, just print the number.

for i in 0...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5){
        print("Buzz")
    } else {
        print(i)
    }
}
