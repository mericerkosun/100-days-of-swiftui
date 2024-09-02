import Cocoa

// How to provide default values for parameters

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5,end: 20)
printTimesTables(for: 5)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// How to handle errors in functions

enum PasswordError : Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let userPassword = "1we5"

do {
    let result = try checkPassword(userPassword)
    print("Password rating \(result)")
} catch PasswordError.short {
    print("Please use a longer password")
} catch PasswordError.obvious {
    print("So obvious")
} catch {
    print("There was an error : \(error.localizedDescription)")
}

print("**********")

// write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches

enum RangeError : Error {
    case outOfBounds, noRoot
}

func findSquareRoot(_ num: Int) throws -> Int {
    guard num > 0 && num <= 10000 else {
        throw RangeError.outOfBounds
    }
    
    for i in 1...num {
        if(num / i == i){
            return i
        }
    }
    throw RangeError.noRoot
}

do {
    let square = try findSquareRoot(64)
    print(square)
} catch RangeError.outOfBounds {
    print("You integer should greater than 0 and less than 10.000")
} catch RangeError.noRoot {
    print("Sorry, can't find the square root.")
}
