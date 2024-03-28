import Foundation

// დავალება 1
enum Gender {
    case male, female
}

// დავალება 2
protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }
}

// დავალება 3
extension SuperBeing {
    var strength: Int { 100 }
    var speed: Int { 100 }
}

// დავალება 4
class Superhero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var outfitColor: String
    var equipment: String
    var vehicle: String
    
    // დავალება 5
    init(name: String, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    
    // დავალება 6
    func rescue(victimName: String) {
        print("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(victimName) გადაარჩინა სიკვდილს")
    }
    
    // დავალება 7
    func combat(villain: SuperVillain) {
        print("\(name) შეერკინა და დაამარცხა \(villain.name).")
    }
}

class SuperVillain: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var evilScheme: String
    var obsession: String
    var rivalry: String
    
    // დავალება 8
    init(name: String, weakness: String, gender: Gender, evilScheme: String, obsession: String, rivalry: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }
    
    // დავალება 9
    func attack(hero: Superhero) {
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(hero.name) მის შეჩერებას თუ შეძლებს")
    }
    
    // დავალება 10
    func experimentation(victimName: String) {
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(victimName).")
    }
}

// დავალება 11
let hero1 = Superhero(name: "სუპერმენი", weakness: "საპიდერმენი", gender: .male, outfitColor: "ლურჯი", equipment: "კაპი", vehicle: "არავინ")
let hero2 = Superhero(name: "ვანდერ წუმენი", weakness: "გიორგი", gender: .female, outfitColor: "წიტელი", equipment: "მართალი", vehicle: "უხილავი")


