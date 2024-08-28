import Cocoa

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Int){
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
    
    mutating func appendInterpolation(_ value: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }
    
    mutating func appendInterpolation(_ values: [String], empty defaultValue: @autoclosure () -> String) {
        if values.count == 0 {
            appendLiteral(defaultValue())
        } else {
            appendLiteral(values.joined(separator: ", "))
        }
    }
    
    mutating func appendInterpolation(if condition: @autoclosure () -> Bool, _ literal: StringLiteralType) {
        guard condition() else {return}
        appendLiteral(literal)
    }
}

let age = 38
print("Hi, I'm \(age).") // Hi, I'm thirty-eight.
print("Today's date is \(Date()).") // Today's date is 26 August 2024 Monday.

let names = ["Meriç","Aşkın","Mert"]
print("Crew : \(names, empty: "No one")")

let doesSwiftRock = true
print("Swift rocks: \(if: doesSwiftRock, "(*)")")
print("Swift rocks: \(doesSwiftRock ? "(*)" : "")") // Bir üst satır ile aynı.

struct Person: Encodable {
    var type: String
    var action: String
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ person: Person){
        appendLiteral("I'm a \(person.type) and I'm gonna \(person.action).")
    }
    
    mutating func appendInterpolation(_ person: Person, count: Int){
        let action = String(repeating: "\(person.action) ", count: count)
        appendLiteral("\n\(person.type.capitalized)s gonna \(action)")
    }
    
    mutating func appendInterpolation<T: Encodable>(debug value: T){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        if let result = try? encoder.encode(value) {
            let str = String(decoding: result, as: UTF8.self)
            appendLiteral(str)
        }
    }
}

let hater = Person(type: "hater", action: "hate")
print("Status check: \(hater)") // Status check: I'm a hater and I'm gonna hate.
// Interpolation don't touch the object's debug description.
print(hater) // Person(type: "hater", action: "hate")

let player = Person(type: "player", action: "play")
let faker = Person(type: "faker", action: "fake")
print("Let's sing: \(player, count: 5) \(hater, count: 5) \(faker, count: 5)")
// Players gonna play play play play play
// Haters gonna hate hate hate hate hate
// Fakers gonna fake fake fake fake fake

print("Here's some data : \(debug: faker)")
//Here's some data : {
//  "action" : "fake",
//  "type" : "faker"
//}

let celsius: Double = 28
let fahrenheit = ((celsius * 9) / 5) + 32
print("The weather is \(celsius)°C and \(fahrenheit)°F.")
// ° -> option + shift + 8
