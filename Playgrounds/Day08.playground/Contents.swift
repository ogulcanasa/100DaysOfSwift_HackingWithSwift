import UIKit

// 1.Creating your own structs
// Variables inside structs are called "Properties"

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"

// 2.Computed properties (a property that runs code to figure out its value.)

struct Sport2 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// 3.Property observers (didSet -> This will run some code every time amount changes)

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// 4.Methods
// Functions inside structs are called "Methods"

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 200
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

// 5.Mutating methods
// If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the struct is constant, so all its properties are also constant regardless of how they were created.

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
person.name

// 6.Properties and methods of strings

let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// 7.Properties and methods of arrays
// Arrays are also structs, which means they too have their own methods and properties.

var toys = ["Woody","Fizz"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
print(toys)

