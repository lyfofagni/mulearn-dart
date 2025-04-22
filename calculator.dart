import 'dart:io';
import 'dart:convert';

/// A simple command-line calculator program in Dart.
///
/// This program presents a menu of arithmetic and comparison operations to the user.
/// It then prompts the user to enter the necessary operands (numbers) and performs
/// the selected operation. The result is printed to the console.
void main() {
  bool running = true;

  while (running) {
    // Display the menu of operations
    print('\nCalculator Menu:');
    print('1. Addition (+)');
    print('2. Subtraction (-)');
    print('3. Multiplication (*)');
    print('4. Division (/)');
    print('5. Greater Than (>)');
    print('6. Less Than (<)');
    print('7. Equal To (==)');
    print('8. Exit');

    // Get the user's choice
    stdout.write('Enter your choice (1-8): ');
    String? choiceStr = stdin.readLineSync();

    // Validate the user's input
    if (choiceStr == null || choiceStr.isEmpty) {
      print('Invalid input. Please enter a number between 1 and 8.');
      continue;
    }

    int choice;
    try {
      choice = int.parse(choiceStr);
    } catch (e) {
      print('Invalid input. Please enter a number between 1 and 8.');
      continue;
    }

    // Perform the selected operation
    switch (choice) {
      case 1:
        performAddition();
        break;
      case 2:
        performSubtraction();
        break;
      case 3:
        performMultiplication();
        break;
      case 4:
        performDivision();
        break;
      case 5:
        performGreaterThan();
        break;
      case 6:
        performLessThan();
        break;
      case 7:
        performEqualTo();
        break;
      case 8:
        print('Exiting calculator...');
        running = false;
        break;
      default:
        print('Invalid choice. Please enter a number between 1 and 8.');
    }
  }
}

/// Prompts the user for two numbers and performs addition.
void performAddition() {
  List<double?>? numbers = getTwoNumbers();
  if (numbers == null) return;

  double num1 = numbers[0]!;
  double num2 = numbers[1]!;

  print('Result: ${num1 + num2}');
}

/// Prompts the user for two numbers and performs subtraction.
void performSubtraction() {
  List<double?>? numbers = getTwoNumbers();
  if (numbers == null) return;

  double num1 = numbers[0]!;
  double num2 = numbers[1]!;

  print('Result: ${num1 - num2}');
}

/// Prompts the user for two numbers and performs multiplication.
void performMultiplication() {
  List<double?>? numbers = getTwoNumbers();
  if (numbers == null) return;

  double num1 = numbers[0]!;
  double num2 = numbers[1]!;

  print('Result: ${num1 * num2}');
}

/// Prompts the user for two numbers and performs division.
void performDivision() {
  List<double?>? numbers = getTwoNumbers();
  if (numbers == null) return;

  double num1 = numbers[0]!;
  double num2 = numbers[1]!;

  if (num2 == 0) {
    print('Error: Cannot divide by zero.');
    return;
  }

  print('Result: ${num1 / num2}');
}

/// Prompts the user for two numbers and performs a "greater than" comparison.
void performGreaterThan() {
  List<double?>? numbers = getTwoNumbers();
  if (numbers == null) return;

  double num1 = numbers[0]!;
  double num2 = numbers[1]!;

  print('Result: ${num1 > num2}');
}

/// Prompts the user for two numbers and performs a "less than" comparison.
void performLessThan() {
  List<double?>? numbers = getTwoNumbers();
  if (numbers == null) return;

  double num1 = numbers[0]!;
  double num2 = numbers[1]!;

  print('Result: ${num1 < num2}');
}

/// Prompts the user for two numbers and performs an "equal to" comparison.
void performEqualTo() {
  List<double?>? numbers = getTwoNumbers();
  if (numbers == null) return;

  double num1 = numbers[0]!;
  double num2 = numbers[1]!;

  print('Result: ${num1 == num2}');
}

/// Helper function to get two numbers from the user.
/// Returns a list containing the two numbers, or null if there was an error.
List<double?>? getTwoNumbers() {
  stdout.write('Enter the first number: ');
  String? num1Str = stdin.readLineSync();
  if (num1Str == null || num1Str.isEmpty) {
    print('Invalid input.');
    return null;
  }

  stdout.write('Enter the second number: ');
  String? num2Str = stdin.readLineSync();
  if (num2Str == null || num2Str.isEmpty) {
    print('Invalid input.');
    return null;
  }

  double num1, num2;
  try {
    num1 = double.parse(num1Str);
    num2 = double.parse(num2Str);
  } catch (e) {
    print('Invalid number format.');
    return null;
  }

  return [num1, num2];
}