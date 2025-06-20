import 'dart:io';

/// Base class: Person
class Person {
  String _name;
  int age;

  // Constructor
  Person(this._name, this.age);

  // Getter for name
  String get name => _name;

  // Setter with validation
  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    } else {
      print("Name cannot be empty.");
    }
  }

  // Method to display person details
  void display() {
    print("Name: $_name, Age: $age");
  }
}

/// Subclass: Student (inherits from Person)
class Student extends Person {
  int rollNumber;
  String course;

  // Default constructor
  Student(String name, int age, this.rollNumber, this.course) : super(name, age);

  // Named constructor
  Student.named({required String name, required int age, required this.rollNumber, required this.course})
      : super(name, age);

  // Override display method
  @override
  void display() {
    print("Roll No: $rollNumber, Name: $name, Age: $age, Course: $course");
  }
}

/// Function to display students by specific course
void displayByCourse(List<Student> students, String courseName) {
  print("\nStudents enrolled in $courseName:");
  for (var student in students) {
    if (student.course.toLowerCase() == courseName.toLowerCase()) {
      student.display();
    }
  }
}

void main() {
  // Creating multiple student objects
  Student s1 = Student("Ali", 20, 101, "CS");
  Student s2 = Student("Sara", 22, 102, "IT");
  Student s3 = Student.named(name: "Ahmed", age: 21, rollNumber: 103, course: "CS");
  Student s4 = Student.named(name: "Zara", age: 23, rollNumber: 104, course: "SE");

  // Updating name with validation
  s4.name = ""; // Invalid name
  s4.name = "Zara Khan"; // Valid name

  // Store in a list
  List<Student> studentList = [s1, s2, s3, s4];

  // Print all student details
  print("All Students:");
  for (var student in studentList) {
    student.display();
  }

  // Filter and display by course
  stdout.write("\nEnter course name to filter (e.g., CS): ");
  String? courseInput = stdin.readLineSync();
  if (courseInput != null && courseInput.isNotEmpty) {
    displayByCourse(studentList, courseInput);
  } else {
    print("Invalid course input.");
  }
}
