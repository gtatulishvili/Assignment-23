import Foundation

// დავალება 1
var product = 1
var number = 1
while number <= 20 {
    if number % 2 != 0 {
        product *= number
    }
    number += 1
}
print(product)

// დავალება 2
var str = "Test"
var reversedStr = ""
for character in str {
    reversedStr = String(character) + reversedStr
}
print(reversedStr)

// დავალება 3
var lights = ["🔴", "🌕", "🟢"]
var index = 0
while index < lights.count {
    print(lights[index])
    index += 1
    if index == lights.count {
        index = 0
        break
    }
}

// დავალება 4
var tickets = 5
while tickets > 0 {
    print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(tickets - 1) რაოდენობა")
    tickets -= 1
}
print("ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე")

// დავალება 5
let array = [1, 2, 3, 4, 5]
var isDistinct = true
for i in 0..<array.count {
    for j in (i + 1)..<array.count {
        if array[i] == array[j] {
            isDistinct = false
            break
        }
    }
    if !isDistinct {
        break
    }
}
if isDistinct {
    print("array-ში ყველა ელემენტი განსხვავებულია")
} else {
    print("array შეიცავს მსგავს ელემენტებს")
}

// დავალება 6
let findDifference = { (a: Int, b: Int) in a - b }
print(findDifference(10, 5))

// დავალება 7
func countConsonants(in string: String) {
    let vowels = "აეიოუ"
    let consonants = string.filter { !vowels.contains($0.lowercased()) && $0.isLetter }
    print("თანხმოვნების რაოდენობა: \(consonants.count)")
}
countConsonants(in: "გეგა")

// დავალება 8
let array1 = [8, 4, 9, 9, 0, 2]
let array2 = [1, 0, 9, 2, 3, 7, 0, 1]
var combinedArray = array1 + array2

for i in 0..<combinedArray.count {
    for j in 1..<combinedArray.count-i {
        if combinedArray[j-1] > combinedArray[j] {
            let temp = combinedArray[j-1]
            combinedArray[j-1] = combinedArray[j]
            combinedArray[j] = temp
        }
    }
}
print(combinedArray)

// დავალება 9
func factorial(of number: Int) -> Int {
    var result = 1
    for i in 1...number {
        result *= i
    }
    return result
}
print(factorial(of: 5))

// დავალება 10
let numbers = Array(0...10)
var evens = [Int]()
var odds = [Int]()

for number in numbers {
    if number % 2 == 0 {
        evens.append(number)
    } else {
        odds.append(number)
    }
}
print("ლუწები: \(evens)")
print("კენტები: \(odds)")

