import Cocoa

// 1. Write a Swift program to compute the sum of the two integers. If the values are equal return the triple their sum.

func sum(number1: Int, number2: Int) -> Int {
    if(number1 == number2){
        return (number1+number2)*3
    } else {
        return number1 + number2
    }
}

sum(number1: 2, number2: 2)

// 2. Write a Swift program to compute and return the absolute difference of n and 51, if n is over 51 return double the absolute difference.

func absoluteDifferent(num: Int) -> Int {
    if(num<51){
        return 51 - num
    } else {
        return (num - 51)*2
    }
}

absoluteDifferent(num: 21)

// 3. Write a Swift program that accept two integer values and return true if one of them is 20 or if their sum is 20.

func isIt20(num1: Int, num2: Int) -> Bool {
    if(num1 == 20 || num2 == 20){
        return true
    } else if(num1 + num2 == 20) {
        return true
    } else {
        return false
    }
}

isIt20(num1: 11, num2: 9)

// 4. Write a Swift program to accept two integer values and return true if one is negative and one is positive. Return true only if both are negative.

func isItPositive(num1: Int, num2: Int) -> Bool {
    if(num1 > 0 && num2 < 0){
        return true
    } else if(num1<0 && num2>0){
        return true
    } else if(num1<0 && num2<0){
        return true
    } else {
        return false
    }
}

isItPositive(num1:12, num2: 5)

// 5. Write a Swift program to add "Is" to the front of a given string. However, if the string already begins with "Is", return the given string.

func addIs(str: String) -> String {
    let newStr = str.uppercased()
    if(newStr.hasPrefix("IS")){
        return str
    } else{
        return "Is" + str
    }
}

addIs(str: "Istanbul")
addIs(str: "istanbul")
addIs(str: "tanbul")

// 6. Write a Swift program to remove a character at specified index of a given non-empty string. The value of the specified index will be in the range 0..str.length()-1 inclusive.

func removeSpecified(str: String, myIndex: Int) -> String {
    if(myIndex >= 0 && myIndex <= str.count){
        var removedStr = str
        let index = removedStr.index(removedStr.startIndex, offsetBy: myIndex)
        removedStr.remove(at: index)
        return removedStr
    } else {
        return "Invalid index"
    }
}

removeSpecified(str: "Python", myIndex: 1)
removeSpecified(str: "Python", myIndex: 0)
removeSpecified(str: "Python", myIndex: 5)

// 7. Write a Swift program to change the first and last character of a given string.

func first_last(str1: String) -> String {
    
    var result = str1
    let first_char = result.remove(at: result.startIndex)
    let findLast = result.index(before: result.endIndex)
    let last_char = result.remove(at: findLast)
    
    result.append(first_char)
    result.insert(last_char, at: result.startIndex)
    
    return result
}


print(first_last(str1: "Swift"))

// 8. Write a Swift program to add the last character (given string) at the front and back of a given string. The length of the given string must be 1 or more.

func addLastChar(str: String) -> String {
    
    if(str.count >= 1) {
        var newStr = str
        var lastChar = newStr.removeLast()
        
        newStr = str
        newStr.append(lastChar)
        newStr.insert(lastChar, at: str.startIndex)
        return newStr
    } else {
        return "Invalid string"
    }
}

addLastChar(str: "a")

// 9. Write a Swift program to check if a given non-negative number is a multiple of 3 or a multiple of 5.

func multiple3or5(num: Int) -> Bool {
    if(num > 0) {
        if(num % 3 == 0 || num % 5 == 0){
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

multiple3or5(num: 33)

// 10. Write a Swift program to take the first two characters from a given string and create a new string with the two characters added at both the front and back.

func twoChar(str: String) -> String {
    let firstTwo = String(str.prefix(2))
    return firstTwo + str + firstTwo
}

twoChar(str: "abc")

// 11. Write a Swift program to test a given string whether it starts with "Is". Return true or false.

func startWithIs(str: String) -> Bool {
    if str.starts(with: "Is") {
        return true
    } else {
        return false
    }
}

startWithIs(str: "Iskywalker")

// 12. Write a Swift program that return true if either of two given integers is in the range 10..30 inclusive.

func inRange(num1: Int, num2: Int) -> Bool {
    if(num1 >= 10 && num1 <= 30){
        return true
    } else if (num2 >= 10 && num2 <= 30){
        return true
    } else {
        return false
    }
}

inRange(num1: 11, num2: 25)

// 13. Write a Swift program to check if a given string begins with "fix", except the 'f' can be any character or number.

func fix_Start(_ input: String) -> Bool {
    var str = input
    str.removeFirst()
    if(str.starts(with: "ix")){
        return true
    } else {
        return false
    }
}

fix_Start("fix gold")
fix_Start("six gold")
fix_Start("1ix gold")
fix_Start("gold")
fix_Start("fax gold")

// 14. Write a Swift program to find the largest number among three given integers.

func largestNumber(num1: Int, num2: Int, num3: Int) -> Int {
    var numbers = [num1,num2,num3]
    numbers.sort()
    if let biggest = numbers.last {
        return biggest
    } else {
        return 0
    }
}

largestNumber(num1: 12, num2: 34, num3: 32)

// 15. Write a Swift program that accept two integer values and to test which value is nearest to the value 10, or return 0 if both integers have same distance from 10.

func nearestTo10(num1: Int, num2: Int) -> Int {
    let firstNum = 10 - num1
    let secondNum = 10 - num2
    
    if(abs(firstNum) < abs(secondNum)){
        return num1
    } else if(abs(secondNum) < abs(firstNum)){
        return num2
    } else {
        return 0
    }
}

nearestTo10(num1: 8, num2: 13)
nearestTo10(num1: 12, num2: 7)
nearestTo10(num1: 14, num2: 6)

// 16. Write a Swift program that accept two integer values and test if they are both in the range 20..30 inclusive, or they are both in the range 30..40 inclusive.

func bothInRange(num1: Int, num2: Int) -> Bool {
    if((num1<=30 && num1>=20) && (num2<=30 && num2>=20)){
        return true
    } else if((num1<=40 && num1>=30) && (num2<=40 && num2>=30)){
        return true
    } else {
        return false
    }
}

bothInRange(num1: 20, num2: 30)
bothInRange(num1: 30, num2: 40)
bothInRange(num1: 42, num2: 51)

// 17. Write a Swift program that accept two positive integer values and test whether the larger value is in the range 20..30 inclusive, or return 0 if neither is in that range.

func largerInRange(num1: Int, num2: Int) -> Int {
    var numbers = [num1,num2]
    numbers.sort()
    if let larger = numbers.last{
        if let smaller = numbers.first{
            if(larger>=20 && larger<=30){
                return larger
            } else if(smaller>=20 && smaller<=30){
                return 1
            } else {
                return 0
            }
        } else {
            return -99
        }
    } else {
        return -99
    }
}

largerInRange(num1: 23, num2: 23)

// 18. Write a Swift program to test whether the last digit of the two given non-negative integer values are same or not.

func lastDigitSame(num1: Int, num2: Int) -> Bool{
    
    
    guard num1 < 0, num2 < 0
    else {
        if(num1 % 10 == num2 % 10){
            return true
        } else {
            return false
        }
    }
    return false
}

lastDigitSame(num1: 14, num2: 24)

// 19. Write a Swift program to convert the last three characters in upper case. If the string has less than 3 chars, lowercase whatever is there.

func upperAndLower(str: String) -> String {
    let count = str.count
    
    if(count >= 3){
        var temp = str
        var lastThree = temp.suffix(3).uppercased()
        temp.removeLast(3)
        return temp + lastThree
    } else {
        return str.lowercased()
    }
}

upperAndLower(str: "trabzonspor")

// 20. Write a Swift program to check if the first instance of "a" in a given string is immediately followed by another "a".

func immediatelyFollowed(_ str: String) -> Bool {
    var temp = str.lowercased()
    
    if(temp.contains("aa")){
        return true
    } else {
        return false
    }
}

immediatelyFollowed("Aarkadaş")

// 21. Write a Swift program to create a string made of every other char starting with the first from a given string. So " Python" will return "Pto"

func pto(input: String) -> String {
    
    var final = ""
    let chars = input
    
    for (index,char) in input.enumerated() {
        if(index % 2 == 0){
            final.append(char)
        }
    }
    
    return final
}

pto(input: "Merhaba")

// 22. Write a Swift program to count the number of 7's in a given array of integers.

func countSevens(array: [Int]) -> Int {
    var count = 0
    for num in array {
        if(num==7){
            count += 1
        }
    }
    
    return count
}

countSevens(array: [1, 2, 7])
countSevens(array: [1, 7, 7])
countSevens(array: [1, 7, 7, 4, 7])

// 23. Write a Swift program to check if one of the first 4 elements in a given array of integers is a 7. The length of the array may be less than 4.

//func firstFour(array: [Int]) -> Bool {
//    let count = array.count
//    
//    if count > 0 && count < 4 {
//        for i in array {
//            if i == 7 {
//                return true
//            }
//        }
//        return false
//    } else if count >= 4 {
//        for (index, number) in array.enumerated() {
//            if index < 4 && number == 7 {
//                return true
//            }
//        }
//        return false
//    } else {
//        return false
//    }
//}

func firstFour(array: [Int]) -> Bool {
    let count = array.count
    
    if(count > 0 && count < 4) {
        for i in array {
            if(i == 7){
                return true
            }
        }
        return false
    } else if (count >= 4) {
        for (index,number) in array.enumerated() {
            if(index < 4 && number == 7) {
                return true
            }
        }
        return false
    } else {
        return false
    }
}

firstFour(array: [1, 2, 7, 3, 4])
firstFour(array: [1, 2, 3, 4, 7])
firstFour(array: [1, 2, 7])

// 24. Write a Swift program to test if the sequence of numbers 0, 1, 2 appears in a given array of integers somewhere.

func sequence(array: [Int]) -> Bool {
    if(array.contains([1,2,3])){
        return true
    } else {
        return false
    }
}

sequence(array: [0, 1, 1, 2, 3, 1])
sequence(array: [0, 1, 1, 2, 4, 1])
sequence(array: [1, 1, 2, 0, 1, 2, 3])


// 25. Write a Swift program to create a new string where all the character "a" have been removed except the first and last positions.
