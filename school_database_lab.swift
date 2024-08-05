struct Student {
  var name: String
  var favoriteTeacherID: Int
}

struct Teacher {
  var name: String
  var id: Int
  var email: String?
  var hairColor: String?
}

struct School {
  var name: String
  var teachers: [Teacher]

  func getTeacher(withID id: Int) -> Teacher? {
    for t in teachers {
        if t.id == id {
          return t
        } 
    }
    return nil
  }

  func printFavoriteTeacherInfo(for student: Student) -> Void {
    guard let t = getTeacher(withID: student.favoriteTeacherID) else {
      print("There isn't a teacher in this school with that ID")
      return
    }
      print("\(student.name)'s favorite teacher is \(t.name)")
      if let hairColor = t.hairColor {
        print("\(t.name)'s hair color is \(hairColor)")
      } else {
        print("No hair color was found for \(t.name)")
      }
      if let email = t.email {
        print("\(t.name)'s email is \(email)")
      } else {
        print("No email was found in the database for \(t.name)")
      }
  }
}

let johnson = Teacher(name: "Ms. Johnson", id: 5258, email: nil, hairColor: "brown")
let garcia = Teacher(name: "Mrs. Garcia", id: 4155, email: "egarcia@school.com", hairColor: nil)
let lee = Teacher(name: "Dr. Lee", id: 4169, email: "dvlee@school.com", hairColor: "pink")

var teacherArray: [Teacher] = [johnson, garcia, lee]
let bobby = Student(name: "Bobby", favoriteTeacherID: 4169)
let joe = Student(name: "Joe", favoriteTeacherID: 5259)

var bestSchool = School(name: "Best School", teachers: teacherArray)
bestSchool.printFavoriteTeacherInfo(for: bobby)
bestSchool.printFavoriteTeacherInfo(for: joe)
