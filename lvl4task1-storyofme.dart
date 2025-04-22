import 'dart:io';

void main() {
  print("Welcome to Biodata Generator!");

  // Collect user information
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync() ?? '';

  stdout.write("Enter your phone number: ");
  String phoneNumber = stdin.readLineSync() ?? '';

  stdout.write("Enter your age: ");
  int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  stdout.write("Enter your height (in cm): ");
  double height = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  stdout.write("Enter your weight (in kg): ");
  double weight = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  stdout.write("Enter your address: ");
  String address = stdin.readLineSync() ?? '';

  // Collect hobbies
  List<String> hobbies = [];
  while (true) {
    stdout.write("Enter a hobby (or type 'done'): ");
    String hobby = stdin.readLineSync() ?? '';
    if (hobby.toLowerCase() == 'done') {
      break;
    }
    hobbies.add(hobby);
  }

  // Generate the biodata
  print("\n--- Biodata ---");
  print("Name: $name");
  print("Phone Number: $phoneNumber");
  print("Age: $age");
  print("Height: ${height}cm");
  print("Weight: ${weight}kg");
  print("Address: $address");
  print("Hobbies:");
  if (hobbies.isNotEmpty) {
    for (var hobby in hobbies) {
      print("- $hobby");
    }
  } else {
    print("No hobbies specified.");
  }
  print("--- End of Biodata ---");

  print("\nBiodata generation complete!");
}
