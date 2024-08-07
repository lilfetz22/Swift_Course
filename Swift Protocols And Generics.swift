//  --------------- 2) Protocols --------------- 
// Write your code below 📜

protocol Incrementable {
    var currentValue: Double { get }
    mutating func increment()
}

struct VisitorCounter: Incrementable {
  var currentValue: Double = 0.0
  mutating func increment() {
    currentValue += 1
  }
}

struct Wage: Incrementable {
  var currentValue: Double = 15.0
  mutating func increment() {
    currentValue += currentValue * 0.10
  }
}

var parkGuests = VisitorCounter()
parkGuests.increment()
print(parkGuests.currentValue)

var salary = Wage()
salary.increment()
print(salary.currentValue)

//  --------------- 3) Protocols in the Swift Standard Library --------------- 
struct Store: Hashable {
  var name: String
  var products: [String]
}

let jaysPizza = Store(name: "Jay's Pizza", products: ["Pizza", "Soda", "Salad"])

let salesByStore: [Store: Double] = [jaysPizza: 100]

//  --------------- 4) Protocol Inheritance --------------- 
// Write your code below 🚗

protocol Car: CustomStringConvertible {
    var model: String { get }
    var topSpeed: Double { get }
    var description: String { get }
}

protocol ElectricCar: Car {
    var range: Double { get }
}

protocol GasCar: Car {
    var milesPerGallon: Double { get }
}

struct Oldsmobile: GasCar {
    let model: String
    let topSpeed: Double
    let milesPerGallon: Double
    var description: String {
        "This is an Oldsmobile \(model) with a top speed of \(topSpeed) that gets \(milesPerGallon) miles per gallon"
    }
    
}

struct Tesla: ElectricCar {
    let model: String
    let range: Double
    let topSpeed: Double
    var description: String {
        "This is a Telsa \(model) with a top speed of \(topSpeed) and a range of \(range)"
    }
}

let modelX = Tesla(model: "Model X", range: 350, topSpeed: 155)
let achieva = Oldsmobile(model: "Achieva", topSpeed: 139, milesPerGallon: 32)
    
let cars: [Car] = [modelX, achieva]
for car in cars {
    print(car.description)
}

//  --------------- 5) Protocol Extensions ---------------
// Write your code below 🍦

protocol IceCreamSelling {
    var flavors: [String] { get }
}

extension IceCreamSelling {
    var flavors: [String] {
      ["Vanilla", "Chocolate"]
    }
}

struct IceCreamTruck: IceCreamSelling {
    let name: String
}

struct IceCreamParlor: IceCreamSelling {
    let name: String
    var flavors: [String] = ["Mint Chip", "Strawberry", "Cookie Dough"]
}

let misterSoftee = IceCreamTruck(name: "Mister Softee")
let popTates = IceCreamParlor(name: "Pop Tate's")

print(misterSoftee.flavors)
print(popTates.flavors)

//  --------------- 6) Generic Functions ---------------
// Write your code below ❌3️⃣

func tripleValues<T: Numeric>(in nums: [T]) -> [T] {
    return nums.map { $0 * 3 }
}

let intArr = [1,2,3]
let doubleArr = [1.0, 2.5, 3.9]

print(tripleValues(in:intArr))
print(tripleValues(in:doubleArr))
//  --------------- 7)  ---------------
// Write your code below 💯

struct GameResult<Score: Comparable>{
    let playerOne: String
    let playerTwo: String
    let playerOneScore: Score
    let playerTwoScore: Score
    func printWinner() {
        if playerOneScore > playerTwoScore {
            print("\(playerOne) Wins!")
        } else if playerOneScore < playerTwoScore {
            print("\(playerTwo) Wins!")
        } else {
            print("It's a tie!")
        }
    }
}

let ufcResult = GameResult(playerOne: "Forrest Griffin",
                           playerTwo: "Stephan Bonnar",
                           playerOneScore: 29,
                           playerTwoScore: 28)
ufcResult.printWinner()

let chessResult: GameResult<Double> = GameResult(playerOne: "Boris Spassky",
                           playerTwo: "Bobby Fischer",
                           playerOneScore: 8.5,
                           playerTwoScore: 12.5)

chessResult.printWinner()
//  --------------- 8) Associated Types ---------------

protocol SummableCollection {
  associatedtype T: AdditiveArithmetic
  var elements: [T] { get }
  var total: T { get }
}

extension SummableCollection {
  var total: T { return elements.reduce(T.zero, +) }
}

struct IntCollection: SummableCollection {
  var name: String
  var elements: [Int]
}

struct DoubleCollection: SummableCollection {
  var name: String
  var elements: [Double]
}
let revenue = DoubleCollection(name: "Monthly Revenue in Thousands", elements: [1.5, 3.2, 1.8])

let homeRuns = IntCollection(name: "Home Runs", elements: [1,0,2])

print(homeRuns.total, revenue.total)
//  --------------- 9) Opaque Types ---------------

protocol ResettableCollection {
    associatedtype T
    var elements: [T] { get }
    mutating func resetAllElements()
}

struct ResettableStringArray: ResettableCollection {
    var elements = [String]()
    mutating func resetAllElements() {
        elements = elements.map { _ in "" }
    }
}

func getResettableCollection() -> some ResettableCollection {
  let greetings = ["hi", "hello"]
  return ResettableStringArray(elements: greetings)
}

var collection = getResettableCollection()
// print(collection.elements[0].lowercased)
collection.resetAllElements()
print(collection)

//  --------------- LAB: Green Thumb  ---------------

// Write your code here 🪴

enum Month {
  case january, february, march, april, may, june, july, august, september, october, november, december
}

protocol Plantable {
  var plantMonth: Month { get }
  var plantingInstructions: String { get }
}
protocol Waterable {
  var inchesOfWater: Int { get }
  var wateringFrequency: String { get }
  var wateringInstructions: String { get }
}
protocol Harvestable {
  var harvestMonth: Month { get }
  var harvestingInstructions: String { get }
}

protocol Gardenable: Harvestable, Plantable, Waterable {
  func printGardeningTips()
}

extension Gardenable {
  
  func printGardeningTips() {
    print("Follow these Gardening 101 tips for a bountiful harvest. \n1) Make sure you always water your plant the exact amount that it needs. \("harvestingInstructions"). \n2) Make sure you know what zone that you're planting in to ensure that the plants you're planting are in their optimal environment.")
  }
}

struct Kale: Gardenable {
  var plantMonth: Month = .september
  var plantingInstructions: String = "Kale should be planted 6 to 8 weeks before the first frost in in-ground gardens, raised beds, or containers."
  var inchesOfWater: Int = 2
  var wateringFrequency: String = "weekly"
  var wateringInstructions: String = "Kale needs to be watered 2 inches of water weekly."
  var harvestMonth: Month = .november
  var harvestingInstructions: String = "Harvest 60 days after planting"
}
func printTips<T: Gardenable>(for plants: [T]) {
    for p in plants {
      p.printGardeningTips()
    }
  }

var vegetables = [Kale()]
printTips(for: vegetables)











