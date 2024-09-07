import Cocoa

// Access Control :
// private : Just that struct can use
// fileprivate : Just that file can use
// public : Everyone can use
// private(set) Let anyone read this property but only let internal methdos write it.

// If a struct property is private then it can't be gererate with default struct initializer. Custom initializer should be use.

// self : The current "value" of a struct.
// Self : The current "type" of a struct.

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    mutating func changeGear(to gear: Int) {
        if(gear > 0 && gear <= 10){
            self.currentGear = gear
        } else {
            print("Error! Gear can't be \(gear).")
        }
    }
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        if(currentGear < 10 && currentGear > 0){
            self.currentGear = currentGear
        } else {
            print("Error! Gear can't be \(currentGear).")
            self.currentGear = 1
        }
    }
}

var honda = Car(model: "Civic", numberOfSeats: 5, currentGear: 14)
print(honda.currentGear)
honda.changeGear(to: 12)
print(honda.currentGear)
