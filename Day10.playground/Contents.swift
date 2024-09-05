import Cocoa

// Struct kendisi ve elemanları constant'tır. Bu yüzden fonksiyon ile eleman değerlerini  değiştirmek için func başına "mutating" eklenir.

struct Salary {
    let name: String
    var salary: Int
    var age: Int = 23 // default value
    
    mutating func increaseSalary(amount: Int){
        if(name=="Meriç"){
            salary += amount
            print("You are \(age) years old.")
            print("Your new salary is \(salary).")
        }
    }
}

// increaseSalary func kullanıp salary değerini değiştirebilmek için oluşturulan struct objesi "variable" olmalıdır. Aksi takdirde hata verir.

var developer = Salary(name: "Meriç", salary: 3000, age: 24)

// Eğer default value "var" ise constructor'da tekrar çağırılabilir.
// Ancak "let" ise tekrar çağırılamaz.
developer.increaseSalary(amount: 500)

struct RubiksCube {
    var size = 3
}
let large = RubiksCube(size: 5)

// Değişkenin orijinal değerini korumak için :

struct Person {
    let name: String
    var money: Int = 3000
    var takenMoney: Int
    
    var moneyRemainig: Int { // Get-only property olduğu için daha sonra atama yapılamaz. Yalnızca değeri okunur.
        money - takenMoney
    }
}

var me = Person(name: "Mert", takenMoney: 500)
print(me.moneyRemainig)
// me.moneyRemainig = 5000 Invalid

// GETTER & SETTER VERSİYONU

struct Person2 {
    let name: String
    var money: Int = 3000
    var takenMoney: Int
    
    var moneyRemainig: Int {
        get {
            money - takenMoney
        }
        set {
            money = takenMoney + newValue
        }
    }
}

var me2 = Person2(name: "Mert", takenMoney: 500)
print(me2.moneyRemainig)
me2.moneyRemainig = 5000 // Valid
print(me2.moneyRemainig)
print(me2.money)

// DID-SET && WILL-SET

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Meriç")
//Current value is: []
//New value will be: ["Meriç"]
//There are now 1 contacts
//Old value was: []

app.contacts.append("Beyza")
//Current value is: ["Meriç"]
//New value will be: ["Meriç", "Beyza"]
//There are now 2 contacts
//Old value was: ["Meriç"]


// How to create custom initializers

struct Player {
    let name: String
    let number: Int
    
//    Classic :
//    init(name: String, number: Int) {
//        self.name = name
//        self.number = number
//    }
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...100)
    }
}

let player = Player(name: "Messi")
print(player.number)

// So, as soon as you add a custom initializer for your struct, the default memberwise initializer goes away. If you want it to stay, move your custom initializer to an extension, like this:

struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee()

