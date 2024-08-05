let words = ["optionals", nil, "are", "great", nil, "at", "handling", nil, "values"]

// Write your code below 🤔

func firstIndex(of target: String, in arr: [String?]) -> Int? {
  for a in arr.indices {
    if case arr[a] = arr[a] {
      if target == arr[a] {
        return a
      }
    }
  }
  return nil
}

if let greatIndex = firstIndex(of: "great", in: words) {
  print(greatIndex)
}
if let badIndex = firstIndex(of: "bad", in: words) {
  print(badIndex)
} else {
  print("words does not contain the string 'bad'")
}