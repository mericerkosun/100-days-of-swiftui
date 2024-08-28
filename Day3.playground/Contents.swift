import Cocoa

var presidents = ["bush","obama","biden","trump"]
var reversedPresidents = presidents.reversed()
print(reversedPresidents) // ReversedCollection<Array<String>>(_base: ["bush", "obama", "biden", "trump"])

for president in reversedPresidents {
    print(president)
}
// trump
// biden
// obama
// bush

let employee = ["name":"Meriç", "job":"Developer", "location":"Turkey"]
print(employee["name", default: "Unknown"])

let capitals = ["England": "London", "Wales": "Cardiff"]
let scotlandCapital = capitals["Scotland"]
 
// Sets :
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])

// Empty Set :
var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")

let arrayOfBlogCategories: [String] = ["Swift", "Debugging", "Xcode"]
let setOfBlogCategories: Set<String> = ["Swift", "Debugging", "Xcode"]

// Enums :

enum Weekday{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.friday
day = Weekday.thursday// Bir kere initialize ettikten sonra değer değiştirirken Enum adını yazmak şart değil.
