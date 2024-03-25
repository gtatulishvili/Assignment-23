import Foundation

// დავალება 1
class Book {
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool

    init(bookID: Int, title: String, author: String, isBorrowed: Bool = false) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }

    func markAsBorrowed() {
        isBorrowed = true
    }

    func markAsReturned() {
        isBorrowed = false
    }
}


// დავალება 2
class Owner {
    let ownerId: Int
    let name: String
    var borrowedBooks: [Book]

    init(ownerId: Int, name: String, borrowedBooks: [Book] = []) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = borrowedBooks
    }

    func borrowBook(book: Book) {
        if !book.isBorrowed {
            book.markAsBorrowed()
            borrowedBooks.append(book)
        }
    }

    func returnBook(book: Book) {
        if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            book.markAsReturned()
            borrowedBooks.remove(at: index)
        }
    }
}


// დავალება 3
class Library {
    var books: [Book]
    var owners: [Owner]

    init(books: [Book] = [], owners: [Owner] = []) {
        self.books = books
        self.owners = owners
    }

    func addBook(book: Book) {
        books.append(book)
    }

    func addOwner(owner: Owner) {
        owners.append(owner)
    }

    func availableBooks() -> [Book] {
        books.filter { !$0.isBorrowed }
    }

    func retrievedBooks() -> [Book] {
        books.filter { $0.isBorrowed }
    }

    func findOwnerById(ownerId: Int) -> Owner? {
        owners.first { $0.ownerId == ownerId }
    }

    func booksBorrowedByOwner(ownerId: Int) -> [Book]? {
        findOwnerById(ownerId: ownerId)?.borrowedBooks
    }

    func allowOwnerToTakeBook(ownerId: Int, bookId: Int) {
        if let owner = findOwnerById(ownerId: ownerId),
           let book = books.first(where: { $0.bookID == bookId && !$0.isBorrowed }) {
            owner.borrowBook(book: book)
        }
    }
}


//დავალება 4
let book1 = Book(bookID: 1, title: "Swift Programming", author: "Apple Inc.")
let book2 = Book(bookID: 2, title: "The Swift Language Guide", author: "Apple Inc.")
let book3 = Book(bookID: 3, title: "Advanced iOS Development", author: "John Doe")

let owner1 = Owner(ownerId: 1, name: "გეგა")
let owner2 = Owner(ownerId: 2, name: "გიორგი")

let library = Library()
library.addBook(book: book1)
library.addBook(book: book2)
library.addBook(book: book3)

library.addOwner(owner: owner1)
library.addOwner(owner: owner2)

library.allowOwnerToTakeBook(ownerId: 1, bookId: 1)
library.allowOwnerToTakeBook(ownerId: 2, bookId: 2)

owner1.returnBook(book: book1)

print("ხელმისაწვდომი წიგნები:")
for book in library.availableBooks() {
    print("\(book.title) \(book.author) ს მიერ")
}

print("\n გატანილი წიგნები:")
for book in library.retrievedBooks() {
    print("\(book.title) \(book.author) ს მიერ")
}

if let gegasBooks = library.booksBorrowedByOwner(ownerId: 1) {
    print("\n წიგნი გატანილია გეგას მიერ:")
    for book in gegasBooks {
        print("\(book.title) \(book.author) ს მიერ")
    }
} else {
    print("\n გეგას არ გაუტანია.")
}


