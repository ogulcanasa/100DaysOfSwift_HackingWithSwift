import UIKit

// 1.Functions

func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}

favoriteAlbum(name: "Fearless")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)

func countLettersInString(in str: String) {
    print("The string '\(str)' has \(str.count) letters")
}

countLettersInString(in: "Hello")

func albumIsTaylors(name: String) -> Bool {
    if name == "Taylor Swift" {return true}
    if name == "Fearless" {return true}
    return false
}

if albumIsTaylors(name: "Taylor Swift") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

if albumIsTaylors(name: "The White Album") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

// 2.Optionals

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "hate"
    }
}

var status = getHaterStatus(weather: "rainy")

if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional string
} else {
    // in case you want an else block, here you go.
}

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008}
    return nil
}

var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int? {
    for i in 0..<array.count {
        if array[i] == string {
            return i
        }
    }
    return nil
}

let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)

var name: String = "Paul"
var name2: String? = "Bob"
var name3: String! = "Sophie"

// 3.Optional chaining

func albumReleased2(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

let album = albumReleased2(year: 2008)?.uppercased()
print("The album is \(album!)")

let album2 = albumReleased2(year: 2003) ?? "unknown"
print("The album is \(album2)")

let str = "Hello World"
print(str.uppercased())

// 4.Enumerations

enum WeatherType {
    case sun, cloud, rain, snow
    case wind(speed: Int)
}

func getHaterStatus2(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .rain:
        return "hate"
    default:
        return nil
    }
}

getHaterStatus2(weather: .wind(speed: 4))

// 5.Structs
// When you define a struct, Swift makes them very easy to create because it automatically generates what's called a memberwise initializer.

struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high levels")

print(taylor.clothes)
print(other.shoes)
taylor.describe()

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)

// 6.Classes
// Differences between "Classes" and "Structs"
//  a.You don't get an automatic memberwise initializer for your classes; you need to write your own.
//  b.You can define a class as being based off another class, adding any new things you want.
//  c.When you create an instance of a class it’s called an object. If you copy that object, both copies point at the same data by default – change one, and the copy changes too.

class Person2 {
    var clothes: String
    var shoes: String

    init(clothes: String, shoes: String) {
        self.shoes = shoes
        self.clothes = clothes
    }
}

class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

class HeavyMetalSinger : Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Grrr rargh rargh rarrrrrgh!")
    }
}
var Jean = HeavyMetalSinger(name: "Jean", age: 25, noiseLevel: 25)
Jean.sing()
