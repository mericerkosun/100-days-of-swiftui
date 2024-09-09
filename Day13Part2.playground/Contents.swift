import Cocoa

// EXTENSIONS

var quote = " The truth is rarely pure and never simple "
var trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let trimmed2 = quote.trimmed()

// Struct'a custom initializer eklenmesi, default memberwise initializer'ı ortadan kaldırır. Ancak İkisini birden kullanmak istiyorsak :

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let hogwarts = Book(title: "Harry Potter", pageCount: 819)

// PROTOCOL EXTENSIONS

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}
// Yukarısı ve aşağısı aynı şeyi ifade eder.(Kod okunma kolaylığı için aşağıdaki faydalıdır.)
extension Array {
    var isNotEmpty: Bool {
        return isEmpty == false
    }
}

print(guests.isNotEmpty) // true

// You see, we just added isNotEmpty to arrays, but what about sets and dictionaries? Sure, we could repeat ourself and copy the code into extensions for those, but there’s a better solution: Array, Set, and Dictionary all conform to a built-in protocol called Collection, through which they get functionality such as contains(), sorted(), reversed(), and more.

// This is important, because Collection is also what requires the isEmpty property to exist. So, if we write an extension on Collection, we can still access isEmpty because it’s required. This means we can change Array to Collection in our code to get this:

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

// Another Example

protocol Person {
    var name: String { get }
    func sayHello()
}

// That means all conforming types must add a sayHello() method, but we can also add a default implementation of that as an extension like this:

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

// And now conforming types can add their own sayHello() method if they want, but they don’t need to – they can always rely on the one provided inside our protocol extension.

// So, we could create an employee without the sayHello() method:

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Person protocolüne kazandırdığımız extension sayesinde Emplyee struct içerisinde protocole ait sayHello fonksiyonun tanımlamak zorunda kalmadan kullanabildik.

// Another Example

let numbers = [4,8,15,16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2)}

let mySet = Set(numbers)
let allEven2 = mySet.allSatisfy { $0.isMultiple(of: 2)}
print(allEven)

// The underlying principle is identical: pass each item in the array or set through a test you provide, and if that returns true for all items then the result of the method is true.

let numbersDic = ["four":4, "eight":8, "fifteen":15, "sixteen":16]
let allEven3 = numbersDic.allSatisfy {$0.value.isMultiple(of: 2)}
print(allEven3)

// Quick Examples:
// 1:

protocol Club {
    func organizeMeeting(day: String)
}
extension Club {
    func organizeMeeting(day: String) {
        print("We're going to meet on \(day).")
    }
}

// 2:
protocol SuperHeroMovie {
    func writeScript() -> String
}
extension SuperHeroMovie {
    func writeScript() -> String {
        return """
        Lots of special effects,
        some half-baked jokes,
        and a hint of another
        sequel at the end.
        """
    }
}

// 3:
protocol Mammal {
    func eat()
}
extension Mammal {
    func eat() {
        print("Time for dinner!")
    }
}
