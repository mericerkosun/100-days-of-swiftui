import Cocoa

// CLASSES

/// Differences between structs:
/// 1. Inheritance
/// 2. Swift won't generate a memberwise initializer for classes.
/// 3. If you copy an instance of a class, both copies share the same data.
/// 4. Deinitializers -> Methods that are called when an instance of class is destroyed.
/// 5. Even if you make a class instance constant, you can still go in and change it's properties. (Properties should ve variable.)

/// Class başına yazılan "final" keyword'ü ; class'ın başka bir class'ı inherit edebileceğini ancak başka bir class tarafından inherit edilemeyeceğini belirtir.

class Employee {
    var hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work(){
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I work \(hours) hours a day while developing app.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let merico = Developer(hours: 8)
let beyz = Manager(hours: 6)

merico.work()
merico.printSummary()

beyz.work()
beyz.printSummary()

// class AppDveloper: Developer {} Valid

// class Assistant: Manager {} Invalid


// SUBCLASS INITIALIZER

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool, isElectric: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let Honda = Car(isConvertible: true, isElectric: false)

// CLASSES ARE REFERENCE TYPES

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1

user2.username = "Merico"

print(user1.username) // Merico
print(user2.username) // Merico

// HOW TO CREATE UNIQUE COPY OF A CLASS INSTANCE ?

class UserAgain {
    var username = "Anonymous"
    
    func copy() -> UserAgain {
        let user = UserAgain()
        user.username = username
        return user
    }
}

var userAgain1 = UserAgain()
var userAgain2 = userAgain1.copy()

userAgain2.username = "Merico"

print(userAgain1.username) // Anonymous
print(userAgain2.username) // Merico

// DEINITIALIZERS

// 1. You don't use func with deinitializers.
// 2. Deinitializers can never take parameters or return data.
// 3. Deinitializers run when the last copy of a class instance is destroyed.
// 4. We never call deinitializers directly.
// 5. Structs don't have deinitializers.

class Person {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Person \(id): I'm alive!")
    }
    
    deinit {
        print("Person \(id): I'm dead!")
    }
}

var persons = [Person]()

for i in 1...3 {
    let person = Person(id: i)
    print("Person \(person.id): I'm in control!")
    persons.append(person)
}

print("Loop is finished!")
persons.removeAll()
print("Array is clear!")

// Person 1: I'm alive!
// Person 1: I'm in control!
// Person 2: I'm alive!
// Person 2: I'm in control!
// Person 3: I'm alive!
// Person 3: I'm in control!
// Loop is finished!
// Person 1: I'm dead!
// Person 2: I'm dead!
// Person 3: I'm dead!
// Array is clear!


// Constant class, constant property -> Signpost that always points to the same user, who always has the same name

// Constant class, variable property -> Signpost that always points to the same user, but their name can change

// Variable class, constant property -> Signpost that can point to different users, but their names never change

// Variable class, variable property -> Signpost that can point to different users, and those users can also change their names.


// Struct'ın içerisindeki property var olsa bile eğer struct const ise property değiştirilemez. Class'larda durum böyle değildir. Because classes points to some data in memory, whereas structs are one value such as the number 5.Bu yüzden class'larda mutating keyword bulunmaz. (Struct const ise mutating keyword işe yaramaz.)


//Checkpoint 7

// • Make a class hierarchy for animals.
// • Start with Animal. Add a legs property for the number of legs an animal has.
// • Make Dog a subclass of Animal, giving it a speak method that prints a dog barking string, but each subclass should print something different.
// • Make TurkishDog and EnglishDog subclasses of Dog.
// • Make Cat an Animal subclass. Add a speak method, with each subclass printing something different, and an isTame Boolean, set with an initializer.
// • Make Persian and Lion as subclasses of Cat.

class Animals {
    private(set) var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animals {
    func speak(){
        print("Barking...")
    }
}

class TurkishDog: Dog {
    override func speak() {
        print("Hav hav hav...")
    }
}

class SwedishDog: Dog {
    override func speak() {
        print("Woof woof...")
    }
}

class Cat: Animals {
    let isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow...")
    }
}

class TurkishCat: Cat {
    override func speak() {
        print("Miyav miyav...")
    }
}

class SwedishCat: Cat {
    override func speak() {
        print("Mjau mjao...")
    }
}

let merlin = TurkishDog(legs: 4)
merlin.speak()
print("Merlin has \(merlin.legs) legs.")
//Hav hav hav...
//Merlin has 4 legs.

let osman = TurkishCat(isTame: true, legs: 4)
osman.speak()
print("Osman has \(osman.legs) legs.")
//Miyav miyav...
//Osman has 4 legs.

let corgi = SwedishDog(legs: 3)
corgi.speak()
print("Corgi has \(corgi.legs) legs.")
//Woof woof...
//Corgi has 3 legs.

let poodle = SwedishCat(isTame: false, legs: 4)
poodle.speak()
print("Poodle has \(poodle.legs) legs.")
//Mjau mjao...
//Poodle has 4 legs.
