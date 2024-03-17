import Foundation


//MARK: დავალება 1
func isMirror(_ string: String) -> Bool {
    let cleanedString = string.replacingOccurrences(of: "", with: "").lowercased()
    return cleanedString == String(cleanedString.reversed())
}

print(isMirror("ანა"))
print(isMirror("აირევი ივერია"))
print(isMirror("მადამ"))
print(isMirror("გეგა"))

//MARK: დავალება 2
func squareAndPrintArray(numbers: [Int]) -> [Int] {
    var squaredNumbers = [Int]()
    for number in numbers {
        squaredNumbers.append(number * number)
    }
    print(squaredNumbers)
    return squaredNumbers
}

let originalNumbers = [1, 2, 3, 4, 5]
let squaredNumbers = squareAndPrintArray(numbers: originalNumbers)

//MARK: დავალება 3
func filterEvens(numbers: [Int]) -> [Int] {
    var evenNumbers = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evenNumbers.append(number)
        }
    }
    return evenNumbers
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let evenNumbers = filterEvens(numbers: numbers)
print(evenNumbers)

//MARK: დავალება 4
func sumArrayAfterDelay(_ numbers: [Int], completion: @escaping (Int) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        let sum = numbers.reduce(0, +)
        completion(sum)
    }
}

sumArrayAfterDelay([1, 2, 3, 4, 5]) { sum in
    print("ჯამი: \(sum)")
}

//MARK: დავალება 5
var contacts: [String: String] = [:]

func addContact(name: String, phoneNumber: String) {
    contacts[name] = phoneNumber
}

func printContact(name: String) {
    if let phoneNumber = contacts[name] {
        print("\(name): \(phoneNumber)")
    } else {
        print("კონტაქტი არ მოიძებნა.")
    }
}

func deleteContact(name: String) {
    if contacts.removeValue(forKey: name) != nil {
        print("\(name) წაიშალა")
    } else {
        print("კონტაქტი არ მოიძებნა.")
    }
}

// კონტაქტის დამატება
addContact(name: "გეგა", phoneNumber: "599699997")
addContact(name: "გიორგი", phoneNumber: "568777321")

// კონტაქტის დაბეჭდვა
printContact(name: "გეგა")

// კონტაქტის მოძებნა
printContact(name: "ანა")

// კონტაქტის წაშლა
deleteContact(name: "გეგა")

//MARK: დავალება 6
func sortedKeys(from dictionary: [String: Int]) -> [String] {
    let sortedKeys = dictionary.keys.sorted()
    return sortedKeys
}

let sampleDictionary: [String: Int] = ["ვაშლი": 3, "ბანანი": 5, "ფორთოხალი": 2, "მანგო": 4]
let sortedKeyArray = sortedKeys(from: sampleDictionary)
print(sortedKeyArray)

//MARK: დავალება 7
func findLargestNumber(_ numbers: [Double]) {
    guard let first = numbers.first else {
        print("მასივი ცარიელია")
        return
    }

    var largest = first

    for number in numbers {
        if number > largest {
            largest = number
        }
    }

    print("ყველაზე დიდი რიცხვი არის: \(largest)")
}

findLargestNumber([1.5, 3.7, 2.8, 5.9, 4.2])

