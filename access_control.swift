//  --------------- 2. Levels of Access --------------- 
struct Cat {    
    public func speak() {
        print("Meeeeoooowww")
    }
    
    internal let color = "Black"
    
    fileprivate var age : Int = 2
    
    private var type = "Ragdoll"
    
}

let scrambles = Cat()

// Could call this from other modules
scrambles.speak()

// Could call this from anywhere within the module
print(scrambles.color)

// Can call this only within this file
print(scrambles.age)

// This is invalid because type is inaccessible outside of the Cat structure
// print(scrambles.type)


// ---------------  3. Defining a Private Property --------------- 
struct Office {
    let paperclipCost = 10

    // 1: Add your private variable below
    private var paperclipSales: Int
    // 2: Add an initializer
    init(paperclipSales: Int){
        self.paperclipSales = paperclipSales
    }

    func printTotalRevenue() {
        // 3: Modify the totalRevenue
        let totalRevenue = paperclipSales * paperclipCost
        print("Our total revenue this month is \(totalRevenue).")
    }
}

// 4: Create an Office
var alphaOffice = Office(paperclipSales: 18)

// 5: Print the total revenue
alphaOffice.printTotalRevenue()

// 6 + 7: Attempt to access a private property
// let invalidAccess = alphaOffice.paperclipSales

// ---------------  4. Defining a Private Method --------------- 
struct Office {    
    let paperclipCost = 10
    private var paperclipSales: Int
    
    init(paperclipSales: Int) {
        self.paperclipSales = paperclipSales
    }
    
    // 1: Create a private method named getSecretRevenue()
    private func getSecretRevenue() -> Int {
      return 100
    }

    func printTotalRevenue() {
        // 2: Add the secret revenue to totalRevenue
        let totalRevenue = (paperclipSales * paperclipCost) + getSecretRevenue()
        print("Our total revenue this month is \(totalRevenue).")
    }
    
}

let alphaOffice = Office(paperclipSales: 18)
alphaOffice.printTotalRevenue()
// 3: Attempt to call the private method
// alphaOffice.getSecretRevenue()

// ---------------  5. Using Read-only Computed Properties --------------- 
struct Office {    
    let paperclipCost = 10
    private var paperclipSales: Int

    // 1: Create a Read-only Computed Property below  
    var totalRevenue: Int {
      get {
        return (paperclipCost * paperclipSales) + getSecretRevenue()
      }
    }


    init(paperclipSales: Int) {
        self.paperclipSales = paperclipSales
    }
    
    private func getSecretRevenue() -> Int {
        return 100
    }
    
    
    func printTotalRevenue() {
        // 2: Modify the function to use the new property
        print("Our total revenue this month is \(totalRevenue)")
    }
}

let alphaOffice = Office(paperclipSales: 18)

// 3: Print the value of alphaOffice's totalRevenue below by accessing the computed variable
print(alphaOffice.totalRevenue)

// ---------------  6) Creating Setters for Computed Properties --------------- 
struct Office {  
    let paperclipCost = 10
    private var paperclipSales: Int
    
    var totalRevenue: Int {
        get {
            return (paperclipCost * paperclipSales) + getSecretRevenue()
        }
        // 1 + 2: Add a setter
        set(newTotalRevenue) {
          paperclipSales = (newTotalRevenue - getSecretRevenue()) / paperclipCost
        }

    }

    init(paperclipSales: Int){
        self.paperclipSales = paperclipSales
    }
    
    private func getSecretRevenue() -> Int {
        return 100
    }
        
    func printTotalRevenue() {
        print("Our total revenue this month is \(totalRevenue)")
    }
}

var alphaOffice = Office(paperclipSales: 18)

// 3: Set the total revenue
alphaOffice.totalRevenue = 400


alphaOffice.printTotalRevenue()


//  --------------- 7) Using Property Observers  --------------- 

struct Office {
    var paperclipCost = 10
    private var paperclipSales: Int {
      willSet {
        print("We adjusted the sales to \(newValue) paperclips.")
      }
      didSet {
        print("Originally, we sold \(oldValue) paperclips.")
        }
    }



    var totalRevenue: Int {
        get {
            return (paperclipSales * paperclipCost) + getSecretRevenue()
        }
        set(newTotalRevenue) {
            paperclipSales = (newTotalRevenue - getSecretRevenue()) / paperclipCost
        }
    }

    init(paperclipSales: Int) {
        self.paperclipSales = paperclipSales
    }
    
    private func getSecretRevenue() -> Int {
        return 100
    }
    
    func printTotalRevenue() {
        print("Our total revenue this month is \(totalRevenue)")
    }
}

var alphaOffice = Office(paperclipSales: 18)
alphaOffice.totalRevenue = 400
alphaOffice.printTotalRevenue()

// --------------- 8) Implementing a Private Setter  --------------- 
struct Office {
    var paperclipCost = 10

    // 1: Give the paperclipSales property a private setter

    internal private(set) var paperclipSales: Int {
        willSet {
            print("We adjusted the sales to \(newValue) paperclips.")
        }
        didSet {
            print("Originally we sold \(oldValue) paperclips.")
        }
    }
    
    var totalRevenue: Int {
        get {
            return (paperclipSales * paperclipCost) + getSecretRevenue()
        }
        set(newTotalRevenue) {
            paperclipSales = (newTotalRevenue - getSecretRevenue()) / paperclipCost
        }
    }

    init(paperclipSales: Int) {
        self.paperclipSales = paperclipSales
    }
    
    private func getSecretRevenue() -> Int {
        return 100
    }
    
    func printTotalRevenue() {
        print("Our total revenue this month is \(totalRevenue).")
    }    
}

var alphaOffice = Office(paperclipSales: 18)
alphaOffice.totalRevenue = 400
alphaOffice.printTotalRevenue()

// 2: Print the value of paperclipSales to the console.
print(alphaOffice.paperclipSales)


// 3 + 4: Attempt to set the value of paperclipSales.
// alphaOffice.paperclipSales = 30


// --------------- 9) Defining a Type Property --------------- 
struct Office {    
    let paperclipCost = 10

    // Write your code below 💼
    static var paperclipSalesRecord: Int = 0 

    private var paperclipSales: Int  {
        willSet {
          if newValue > Office.paperclipSalesRecord {
            Office.paperclipSalesRecord = newValue
          }
            print("We adjusted the sales to \(newValue) paperclips")
        }
        didSet {
            print("Originally we sold \(oldValue) paperclips")
        }
    }
    
    var totalRevenue : Int {
        get {
            return (paperclipSales * paperclipCost) + getSecretRevenue()
        }
        set(newTotalRevenue) {
            paperclipSales = (newTotalRevenue - getSecretRevenue()) / paperclipCost
        }
    }

    init(paperclipSales: Int){
        self.paperclipSales = paperclipSales
    }
    
    private func getSecretRevenue() -> Int {
        return 100
    }
    
    func printTotalRevenue() {
        print("Our total revenue this month is \(totalRevenue)")
    }
    
}

var alphaOffice = Office(paperclipSales: 18)
alphaOffice.totalRevenue = 400
alphaOffice.printTotalRevenue()
print(Office.paperclipSalesRecord)
// --------------- 10) Extensions --------------- 
struct Office {
    let paperclipCost = 10
    static var paperclipSalesRecord: Int = 0
    private var paperclipSales: Int  {
        willSet {
            print("We adjusted the sales to \(newValue) paperclips")
            if newValue > Office.paperclipSalesRecord {
              Office.paperclipSalesRecord = newValue
            }
        }
        didSet {
            print("Originally we sold \(oldValue) paperclips")
        }
    }
    
    var totalRevenue : Int {
        get {
            return (paperclipSales * paperclipCost) + getSecretRevenue()
        }
        set(newTotalRevenue) {
            paperclipSales = (newTotalRevenue - getSecretRevenue()) / paperclipCost
        }
    }

    init(paperclipSales: Int){
        self.paperclipSales = paperclipSales
    }
    private func getSecretRevenue() -> Int {
        return 100
    }
    func printTotalRevenue() {
        print("Our total revenue this month is \(totalRevenue)")
    }
}

// Write your extension here:
extension Office {
  static func printCurrentRecord() {
    print("The current record for paperclip sales is \(paperclipSalesRecord)")
  }
  var paperclipColor: String { return "gray" }
}
var alphaOffice = Office(paperclipSales: 18)
alphaOffice.totalRevenue = 400

// Use the new methods and properties here:
Office.printCurrentRecord()
print("Alpha Office's paperclips are \(alphaOffice.paperclipColor)")

// --------------- SWIFT BANK LAB --------------- 
// Write your code below 🏦
// Write your code below 🏦
struct SwiftBank {
  private let password: String
  func displayLowBalanceMessage() {
    print("Alert: Your balance is under $100")
  }
  private var balance: Double = 0 {
    didSet {
      if balance < 100 {
        displayLowBalanceMessage()
      } 
    }
  }
  static var depositBonusRate: Double = 0.01
  private var numLargeDeposits: Int = 0
  var initialDeposit: Double = 0.0

  init (password: String, initialDeposit: Double) {
    self.password = password
    self.initialDeposit = makeDeposit(ofAmount: initialDeposit)
  }

  private func isValid(_ enteredPassword: String) -> Bool {
    return enteredPassword == password
  }

  private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
    return deposit + (deposit * SwiftBank.depositBonusRate)
  }

  mutating func makeDeposit(ofAmount depositAmount: Double) -> Double {
    var depositWithBonus = depositAmount
    if (depositAmount >= 1000) && (numLargeDeposits < 1) {
      depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
      print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus). ")
      numLargeDeposits += 1
    } else {
      print("Making a deposit of $\(depositAmount).")
    }
    balance += depositWithBonus
    return depositWithBonus
  }

  func displayBalance(usingPassword password: String) {
    if isValid(password) {
      print("Your current balance is $\(balance).")
      return
    } else {
      print("Error: Invalid password. Cannot retrieve balance.")
      return
    }
  }

  mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
    if isValid(password) {
      balance -= withdrawalAmount
      print("Making a $\(withdrawalAmount) withdrawal.")
      return
    } else {
      print("Error: Invalid password. Cannot make withdrawal.")
      return
    }

  }
}

var myAccount = SwiftBank(password: "bgbgb", initialDeposit: 500)
myAccount.makeDeposit(ofAmount: 200)
myAccount.displayBalance(usingPassword: "bgbgb")
myAccount.makeWithdrawal(ofAmount: 200, usingPassword: "bgbb")
myAccount.makeWithdrawal(ofAmount: 200, usingPassword: "bgbgb")
myAccount.makeDeposit(ofAmount: 1500)
myAccount.displayBalance(usingPassword: "bgbgb")
myAccount.makeDeposit(ofAmount: 1900)
myAccount.displayBalance(usingPassword: "bgbgb")


// Making a deposit of $500.0.
// Making a deposit of $200.0.
// Your current balance is $700.0.
// Error: Invalid password. Cannot make withdrawal.
// Making a $200.0 withdrawal.
// Making a deposit of $1500.0 with a bonus rate. The final amount deposited is $1515.0. 
// Your current balance is $2015.0.
// Making a deposit of $1900.0.
// Your current balance is $3915.0.



















