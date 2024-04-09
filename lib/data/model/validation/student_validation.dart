class StudentValidator {
  (bool, String) validate(dynamic data) {
    // print("--------------------------------");
    // print(data);
    // print("--------------------------------");

    if (data is Map<dynamic, dynamic>) {
      if (data.containsKey("students") && data["students"] is List) {
        List<dynamic> students = data["students"];
        for (var student in students) {
          // print(!_validateStudent(student).$1);
          if (!_validateStudent(student).$1) {
            // print(student["grad"]);
            // print("////////////////////////////////");
            // print(!student.containsKey('name'));
            // print(!student.containsKey('family_name'));
            // print(!student.containsKey('age'));
            // print(!student.containsKey('grad'));
            // print("////////////////////////////////");

            // print("khadado");
            return _validateStudent(student);
          }
        }
        // print(" the single student is valid -----------------------------");

        return (true, "It's valid.");
      } else {
        return _validateStudent(data);
      }
    } else {
      // print("Invalid data type");
      return (false, "there is error check your file ");
    }
  }

  (bool, String) _validateStudent(Map<dynamic, dynamic> studentData) {
    // Validate student data here
    if (!studentData.containsKey('name') ||
        !studentData.containsKey('family_name') ||
        !studentData.containsKey('age') ||
        !studentData.containsKey('grad')) {
      // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      return (
        false,
        "There is a missing field; one of the following: name, family name, or age grade."
      );
    }
    if (studentData.length != 4 &&
        !(studentData.length == 5 && studentData.containsKey('email'))) {
      return (false, "Unexpected fields found in the student data.");
    }

    var name = studentData['name'];
    var familyName = studentData['family_name'];
    var age = studentData['age'];
    var grad = studentData['grad'];

    if (name is! String || familyName is! String || age is! int) {
      // print("hyhy");
      return (
        false,
        "One item is not correct (name is not a string, family name is not a string, or age is not an integer)."
      );
    }

    if (name.isEmpty || familyName.isEmpty || age <= 0) {
      // print("hoho");
      return (false, "One of the fields (name, family, or age) is empty.");
    }
    //////////////// check grad
    if (grad != null && grad is Map<dynamic, dynamic>) {
      var math = grad['math'];
      var physical = grad['physical'];
      var compilation = grad['compilation'];

      if (!grad.containsKey('math') ||
          !grad.containsKey('physical') ||
          !grad.containsKey('compilation')) {
        return (
          false,
          "There is a missing field; one of the following: name, family name, or age grade."
        );
      }
      if (grad.length != 3) {
        return (false, "Unexpected fields found in the grad data.");
      }

      if (math is! int ||
          physical is! int ||
          compilation is! int ||
          math < 0 ||
          math > 20 ||
          physical < 0 ||
          physical > 20 ||
          compilation < 0 ||
          compilation > 20) {
        // print("hehe");
        return (false, "The grade is not between 0 and 20.");
      }
    } else {
      // print("haha");
      return (false, "There is an error in the grade.");
    }

    if (studentData.containsKey('email')) {
      var email = studentData['email'];
      if (email != null && email is! String) {
        return (false, "Email string not correctly formatted.");
      }
    }

    return (true, "It's valid.");
  }
}
