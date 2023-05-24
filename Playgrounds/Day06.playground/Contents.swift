import UIKit

// 1.Creating basic closures

let driving = {
    print("I'm driving in my car")
}

driving()

// 2.Accepting parameters in a closure
// One of the differences between functions and closures is that you don’t use parameter labels when running closures.

let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving2("London")

// 3.Returning values from a closure

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// 4.Closures as parameters

let driving3 = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived")
}

travel(action: driving3)

// 5.Trailing closure syntax
// If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax.

func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

// Because its last parameter is a closure, we can call travel() using trailing closure syntax like this:

travel2() {
    print("I'm driving in my car")
}

// In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:

travel2 {
    print("I'm driving in my car")
}
