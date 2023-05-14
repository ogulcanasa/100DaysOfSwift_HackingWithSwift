import UIKit

// 1.Variables (Variables allow us to store temporary information in our program.)

var str = "Hello, playground"
str = "Goodbye"

// 2.Strings and integers
// Swift is type-safe language, which means that every variable must be of one specific type.

var age = 38
var population = 8_000_000

// 3.Multi-line strings

var str1 = """
This goes
over multiple
lines
"""

var str2 = """
This goes \
over multiple \
lines
"""

// 4.Doubles and Booleans (Doubles are type of Floats - 64 bits)
// Double” is short for “double-precision floating-point number”, and it’s a fancy way of saying it holds fractional values such as 38.1, or 3.141592654.

var pi = 3.141
var awesome = true

// 5.String interpolation (We can place any type of variable inside our string.)
// Swift assigns each variable and constant a type based on what value it’s given when it’s created

var score = 85
var str3 = "Your score was \(score)"
var results = "The test results are here: \(str3)"

// 6.Constants (We can't change their values once they are set.)

let taylor = "swift"
// Error => taylor = "code"

// 7.Type annotations (Booleans have the short type name Bool, Integers => Int)

let str4 = "Hello, playground"
let album: String = "Reputation"
let year : Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

// 8.Simple types: Summmary
// One: You make variables using "var" and constants using "let". It's preferable to use constants as often as possible.
// Two: Strings start and end with double quotes, but if you want them to run across multiple lines you should use three sets of double quotes.
// Three: Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
// Four: String interpolation allows you to create strings from other variables and constants, placing their values inside your string.
// Five: Swift uses type inferences to assign each variable or constant a type, but you can provide explicit types if you want.

