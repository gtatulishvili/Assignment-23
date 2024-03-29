import Foundation

protocol Item {
    var name: String { get }
}

struct Pen: Item {
    var name: String
}

class Notebook: Item {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Person {
    var name: String
    var favoriteBook: Book?
    var favoritePen: Pen?
    
    init(name: String, favoritePen: Pen) {
        self.name = name
        self.favoritePen = favoritePen
        print("\(name) ინიციალიზებულია")
    }
    
    deinit {
        print("\(name) დეინიციალიზდება")
    }
}

class Book {
    var title: String
    weak var owner: Person?
    
    init(title: String) {
        self.title = title
        print("\(title) ინიციალიზებულია")
    }
    
    deinit {
        print("\(title) დეინიციალიზდება")
    }
}

class MyClass {
    var myClosure: (() -> Void)?
    var property: String = "გამარჯობა"
    
    init() {
        myClosure = { [weak self] in
            guard let strongSelf = self else { return }
            print(strongSelf.property)
        }
    }
    
    deinit {
        print("MyClass დეინიციალიზდება")
    }
}

func testARC() {
    let favoritePen = Pen(name: "პილოტი")
    var gega: Person? = Person(name: "გეგა", favoritePen: favoritePen)
    var ProgrammingBook: Book? = Book(title: "წიგნი პროგრამისტებისთვის")

    gega?.favoriteBook = ProgrammingBook
    ProgrammingBook?.owner = gega
    
    var myClassInstance: MyClass? = MyClass()
    myClassInstance?.myClosure?()
    myClassInstance = nil
    
    gega = nil
    ProgrammingBook = nil
}

testARC()
