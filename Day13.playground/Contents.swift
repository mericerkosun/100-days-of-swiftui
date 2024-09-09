import Cocoa

// Protocols let us define how structs, classes, and enums ought to work: what methods they should have, and what properties they should have. Swift will enforce these rules for us, so that when we say a type conforms to a protocol Swift will make sure it has all the methods and properties required by that protocol.

// In practice, what protocols allow us to do is treat our data in more general terms. So, rather than saying “this buy() method must accept a Book object,” we can say “this method can accept anything that conforms to the Purchaseable protocol. That might be a book, but it might also be a movie, a car, some coffee, and so on – it makes our simple method more flexible, while ensuring that Swift enforces the rules for us.

// In code terms, our simple buy() method that works only with books would look like this:

struct Book {
    var name: String
}

func buy(_ book: Book) {
    print("I'm buying \(book.name)")
}

// To create a more flexible, protocol-based approach we would first create a protocol that declares the basic functionality we need. This might be many methods and properties, but here we’re just going to say that we need a name string:

protocol Purchaseable {
    var name: String { get set }
}

// Now we can go ahead and define as many structs as we need, with each one conforming to that protocol by having a name string:


struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Motorcycle: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

// You’ll notice each one of those types has a different property that wasn’t declared in the protocol, and that’s okay – protocols determine the minimum required functionality, but we can always add more.

// Finally, we can rewrite the buy() function so that it accepts any kind of Purchaseable item:

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}


// ANOTHER EXAMPLE

protocol Vehicle {
    var name: String { get } // Readable
    var currentPassanger: Int { get set } // Readable and writable
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    
    let name = "Car"
    var currentPassanger = 1
    
    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof(){
        print("It's a nice day.")
    }
}

struct Bicycle: Vehicle {
    
    let name = "Bicycle"
    var currentPassanger = 1
    
    func estimateTime(for distance: Int) -> Int {
        return distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

func commute(distance: Int, using vehicle: Vehicle){
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimate(using vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimate(using: [car,bike], distance: 150)

// OPAQUE RETURN TYPES

/// Opaque return type döndürme, belirli bir tür döndürmek yerine işlevselliğe odaklanabileceğimiz anlamına gelir.
/// Sadece "Vehicle" döndürmek; "Herhangi bir vehicle türü ama ne olduğunu bilmiyoruz." anlamına gelir.
/// "some Vehicle" döndürmek ise; "Belirli bir Vehicle türü ama ne hangisi olduğunu söylemek istemiyoruz." anlamına gelir.

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())
