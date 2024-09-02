import Cocoa

func areTheySame(str1: String, str2: String) -> Bool {
    var letters = [Character]()
    var letters2 = [Character]()
    var count1 = 0
    var count2 = 0
    
    for i in str1 {
        letters.append(i)
        count1 += 1
    }
    
    for i in str2 {
        letters2.append(i)
        count2 += 1
    }
    
    var lettersSet = Set(letters)
    var letters2Set = Set(letters2)
    
    if((lettersSet == letters2Set) && (count1 == count2)) {
        return true
    } else {
        return false
    }
}

areTheySame(str1: "abc", str2: "cba")

func areTheySameSorted(str1: String, str2: String) -> Bool {
    return str1.sorted() == str2.sorted()
}

// Fonksiyon tek bir satır koda sahip olduğunda bool döndürmek için return yazılmasa da olur. Swift anlar.

areTheySameSorted(str1: "bolu", str2: "olub")

func pisagor(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let c = sqrt(input)
    return c
}

print(pisagor(a: 3, b: 4))

// Returning multiple values

func getUser() -> [String:String] {
    ["first name":"Meriç","last name":"Erkoşun"]
}

let user = getUser()
print("Name : \(user["first name", default: "?"]) \(user["last name",default: "?"])")

// Better : Tuple

func getUserTuple() -> (firstName: String, lastName: String) {
    return (firstName: "Meriç", lastName: "Erkoşun" )
}

let userTuple = getUserTuple()
print("Name: \(userTuple.firstName) \(userTuple.lastName)")

// Tuple'larda parametre adı verilmeden kullanım mümkün. Indexleri ile çağırılır.

func getUserTupleV2() -> (String,String) {
    return ("Meriç","Erkoşun" )
}

let userTupleV2 = getUserTupleV2()
print("Name: \(userTuple.0) \(userTuple.1)")

// Destructuring

let (firstName,lastName) = getUserTupleV2()
print("Name: \(firstName) \(lastName)")

// Kullanmak istemediğimiz parametre için _ yazarız.
let (newFirstName,_) = getUserTupleV2()
print("First Name: \(newFirstName)")

