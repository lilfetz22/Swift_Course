// 2. Defining a Closure
// Write your closure below
let helloClosures = {
  print("Hello closures!")
}
helloClosures()

// 3. Inputs and Outputs
// Enter your code below
let add: (Int, Int) -> Int = { (first, second) in
  return first + second
}

print(add(4, 1))

// 4.Passing a closure to a function
// For this exercise we will create a game that calculates the sum of a hand of cards. We will make the game configurable such that it accepts a closure defining the rules for how cards are counted.

let cards = [8,2,5,3,4]

func handValue(cards: [Int], scoringRules: (Int) -> Int) -> Int {
  var totalValue = 0
  for card in cards {
    totalValue += scoringRules(card)
  }
  return totalValue
}
let allCards = { (card: Int) -> Int in 
  return card
}

print(handValue(cards: cards, scoringRules: allCards))

let onlyEvens = { (card: Int) -> Int in
    if card.isMultiple(of: 2) {
        return card
    } else {
        return 0
    }
}

let result = handValue(cards: cards, scoringRules: onlyEvens)
print(result)

// 5.
// Enter your code below

func bake(ingredient: String, completionAction: (String) -> Void) {
  print("Baking \(ingredient)")
  completionAction(ingredient)
}
bake(ingredient: "salt") { ingredient in
  print("Finished baking \(ingredient)")
}



// 6.
// We have a function that transforms an array of strings.

let strings = ["remit", "spans", "level"]

func transform(strings: [String], transformer: (String) -> String) -> [String] {
  var transformedStrings = [String]()
  for string in strings {
    transformedStrings.append(transformer(string))
  }
  return transformedStrings
}

print(transform(strings: strings) { (str: String) -> String in
    return String(str.reversed())
})
print(transform(strings: strings) { str in
    String(str.reversed())
})
print(transform(strings: strings) { String($0.reversed())})

// 7. Built-in Higher-Order Functions
/// Enter your code below

var names = ["Jason", "Kimberly", "Zach", "Austin", "Sarah", "Adam", "Kathy"]

let aNames = names.filter { $0.starts(with: ["A"]) }
print(aNames)
let sortedNames = names.sorted(by: <)
print(sortedNames)

// 8. Escaping Closures
struct NumberPrinter {
    var startAction: () -> Void
    var completeAction: () -> Void
    
    mutating func setStartAction(to action: @escaping () -> Void) {
        self.startAction = action
    }
    
    mutating func setCompleteAction(to action: @escaping () -> Void) {
        self.completeAction = action
    }
    
    func printNumber(using numberGenerator: () -> Int) {
        startAction()
        print(numberGenerator())
        completeAction()
    }
}

let printer = NumberPrinter(startAction: { print("Starting!") }, completeAction: { print("Finished!") })

printer.printNumber(using: { Int.random(in: 1..<100) })
printer.printNumber(using: { Int.random(in: 1..<5) })


// 9. Capturing Values
func createMultiplier(factor: Int) -> () -> Int {
  let value: Int = 1
  return { 
    return value * factor
  }
}

let multiplier = createMultiplier(factor: 3)
print(multiplier())
print(multiplier())
print(multiplier())

// Codecademy's solution:
func createMultiplier(factor: Int) -> () -> Int {
  var value = 1
  let multiplier: () -> Int = {
    value *= factor
    return value
  }
  return multiplier
}

let multiplier = createMultiplier(factor: 3)
print(multiplier())
print(multiplier())
print(multiplier())

// Calculator

struct Calculator {
  func reduce(_ nums: [Int], using nextPartialResult: (Int, Int) -> Int, startingAt: Int) -> Int {
      var total = startingAt
      for num in nums {
        total = nextPartialResult(total, num)
      }
      return total
  }

  // filter items out of the list
  func filter(_ nums: [Int], using isIncluded: (Int) -> Bool) -> [Int] {
    var filteredNums = [Int]()
    for num in nums {
      if isIncluded(num) == true {
        filteredNums.append(num)
      }
    }
    return filteredNums
  }
  func map(_ nums: [Int], using transform: (Int) -> Int) -> [Int]{
    var mappedNums = [Int]()
    for num in nums {
      mappedNums.append(transform(num))
    }
    return mappedNums
  }
    func sort(_ nums: [Int], by areInIncreasingOrder: (Int, Int) -> Bool) -> [Int] {
        var nums = nums
        for indexOne in 1..<nums.count {
            var indexTwo = indexOne
            while indexTwo > 0 && areInIncreasingOrder(nums[indexTwo], nums[indexTwo - 1]) {
                nums.swapAt(indexTwo - 1, indexTwo)
                indexTwo -= 1
            }
        }
        return nums
    }
}

var someInts = [2,6,8,2]
var calc = Calculator()

let addition: (Int, Int) -> Int = { (first, second) in
  return first + second
}
let sum = calc.reduce(someInts, using: addition, startingAt: 0)
print(sum)

// Array for filtering
var moreInts: [Int] = [2, 8, 0]
print(calc.filter(moreInts, using: { int in int != 0 }))

print(calc.map(someInts, using: { int in int + 10 }))
print(calc.sort(someInts, by: <))







