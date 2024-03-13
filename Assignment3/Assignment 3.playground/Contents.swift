import Foundation

// დავალება 1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.
let number1 = 3
let number2 = 4
let number3 = 5
print(number1 * number2 * number3)

// დავალება 2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.
let number = 7
let isEven = number % 2 == 0 ? "Even" : "Odd"
print(isEven)

// დავალება 3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ
var myName: String? = "Gega"
if let name = myName {
    print(name)
}

// დავალება 4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.
let isRaining = true
if isRaining {
    print("ქოლგის წაღება არ დამავიწყდეს")
} else {
    print("დღეს ქოლგა არ დამჭირდება")
}

// დავალება 5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”
let a = 10
let b = 20
if a > b {
    print("a მეტია")
} else {
    print("b მეტია")
}

// დავალება 6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.
let firstLetter: Character = "G"
print(firstLetter)

// დავალება 7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი
let twoDigitNumber = 77
let digit1 = twoDigitNumber / 10
let digit2 = twoDigitNumber % 10
digit1 == digit2 ? print("ერთიდაიმავე ციფრისგან არის შემდგარი") : print("ერთიდაიმავე ციფრისგან არ არის შემდგარი")

// დავალება 8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.
let numberOfMonths = 4
var season = ""
if numberOfMonths == 12 || numberOfMonths == 1 || numberOfMonths == 2 {
    season = "ზამთარი"
} else if numberOfMonths >= 3 && numberOfMonths <= 5 {
    season = "გაზაფხული"
} else if numberOfMonths >= 6 && numberOfMonths <= 8 {
    season = "ზაფხული"
} else if numberOfMonths >= 9 && numberOfMonths <= 11 {
    season = "შემოდგომა"
}
print(season)

// დავალება 9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”
let divisibleNumber = 12
if divisibleNumber % 3 == 0 && divisibleNumber % 4 == 0 {
    print("იყოფა 3-ზე და 4-ზე")
} else if divisibleNumber % 3 == 0 {
    print("იყოფა 3-ზე")
} else if divisibleNumber % 4 == 0 {
    print("იყოფა 4-ზე")
}

// დავალება 10. შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი
let num1 = 5
let num2 = -5
let distance = num1 == -num2 ? "თანაბრად დაშორებულია ნულიდან" : "არ არის თანაბრად დაშორებული ნულიდან"
print(distance)
