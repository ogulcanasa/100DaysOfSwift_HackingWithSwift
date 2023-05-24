import UIKit

// 1.Initializers

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"
print(user.username)

// 2.Referring to the current instance

struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// 3.Lazy properties (As a performance optimization, Swift lets you create some properties only when they are needed.)

struct FamilyTree {
    init() {
        print("Creeating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
ed.familyTree

// 4.Static properties and methods
// Swift can share specific properties and methods across all instances of the struct by declaring them as "static".

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let edd = Student(name: "Edd")
let taylor = Student(name: "Taylor")
let ogi = Student(name: "Ogi")
print(Student.classSize)

// 5.Access control

struct Person3 {
    private var id: String
    var age: Int
    
    init(id: String, age: Int) {
        self.id = id
        self.age = age
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let Eddd = Person3(id: "12345",age: 24)
Eddd.age
// We can't access the id because of "private" keyword => Edd.id
Eddd.identify()

// 6.Structs summary
// One: You can create your own types using structures, which can have their own properties and methods.
// Two: You can use stored properties or use computed properties to calculate values on the fly.
// Three: If you want to change a property inside a method, you must mark it as mutating.
// Four: Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
// Five: Use the self constant to refer to the current instance of a struct inside a method.
// Six: The lazy keyword tells Swift to create properties only when they are first used.
// Seven: You can share properties and methods across all instances of a struct using the static keyword.
// Eight: Access control lets you restrict what code can use properties and methods.
