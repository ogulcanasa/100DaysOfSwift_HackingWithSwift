import UIKit

// 1.Properties
// In "willSet" Swift provides your code with a special value called "newValue" that contains what the new property value is going to be, in "didSet" you are given "oldValue" to represent the previous value.

struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }

        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts")
taylor.clothes = "short skirts"

struct Person2 {
    var age: Int
    var ageInDogYears: Int {
            return age * 7
    }
}

var fan = Person2(age: 25)
print(fan.ageInDogYears)

// 2.Static properties and methods

struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}

let fan2 = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong) // Static methods belong to the struct itself

// 3.Access control
// public: This means everyone can read and write the property.
// internal: This means only your Swift code can read and write the property.
// fileprivate: This means that only Swift code in the same file as the type can read and write the property.
// private: This is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.

class TaylorFan2 {
    private var name: String?
}

// 4.Polymorphism and typecasting

class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
         return "The studio album \(name) sold lots"
    }
}

class LiveAlbum : Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

// LiveAlbum is inherited from Album it can be treated just as either Album or LiveAlbum – it's both at the same time. This is called "Polymorphism".

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studio")
var fearless = StudioAlbum(name: "Fearless", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
    
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

let number = 5
let text = String(number)
print(text)

// 5.Closures

let vw = UIView()

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
