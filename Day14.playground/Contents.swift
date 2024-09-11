import Cocoa

// OPTIONALS

// 1. if let :

var ages: [Int] = [2,34,56]
var ages2 : [Int] = []

if let oldestAge = ages.last {
    print(oldestAge)
} else {
    print("Nil")
} // 56

if let oldestAge = ages2.last {
    print(oldestAge)
} else {
    print("Nil")
} // Nil

// Another Example
var number: Int? = 12

if let number = number {
    print(number)
}

// Yukarıdaki örenk aşağıdaki gibi de yazılabilir :

if let number {
    print(number)
}

// Eğer ages.last nil değil ise gelen değer oldestAge'a atanır ve yalnızca o scope içerisinde geçerli olur. Nil ise else bloğu çalışır.

// 2. nil coalescing :

let newAge = ages.last ?? 999

// Eğer ages.last nil değilse gelen değer newAge'e atanır. nil ise deafult değer olarak ?? sağındaki değer atanır.
// Chain version: var savedData = first() ?? second() ?? "anaonymus"

// 3. guard statement :

func getOldestAge () {
    guard let oldestage = ages.last else { return }
    print(oldestage)
}

// Eğer gelen değer nil ise function direkt olarak sonlanır. Nil değilse oldestAge'e atnır ve tüm function scope'unda geçerli olur.

// 4. force unwrap :

let biggestAge = ages.last! // Tehlikeli ve crash sebebi


///  1 - Optional bir değişkene sonradan bir değer atanmış olsa bile o değişken hala optional'dir. Unwrap zorunludur.
///  2 - If the optional you're unwrapping has a value you can use it after the guard code finished.
///  3 - Swift requires you to use return if a guard check fails.
///  4 - You can use guard with any condition, including ones that didn't wrap optionals. ( guard someArray.isEmpty else {return} )
///  5 - Reading a dictionary key will always return an optional.
///  6 - When using dictionaries :
///             let crush = score["crusher", default : 0]
///             let crush = score["crusher"] ?? 0
///     İkisi de aynı şeyi ifade eder.

// Checkpoint 9 :

func randomInAnArray(array: [Int]?) -> Int {
    return array?.randomElement() ?? Int.random(in: 0...100)
}

let myArray: [Int]? = nil
randomInAnArray(array: myArray)

let myArray2: [Int] = [23,465,123,65,3,112]
randomInAnArray(array: myArray2)
