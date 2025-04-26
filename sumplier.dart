import 'dart:io';

/// A program to generate multiplication tables and compute their sum.
void main() {
  // Prompt the user to enter a number.
  stdout.write('Enter a number to generate its multiplication table: ');
  String? input = stdin.readLineSync();

  // Check if the input is null. If so, exit the program.
  if (input == null) {
    print('Invalid input. Exiting.');
    return;
  }

  // Try parsing the input to an integer. Handle potential errors.
  try {
    int number = int.parse(input);

    // Generate the multiplication table and compute the sum.
    generateMultiplicationTable(number);
  } catch (e) {
    // Handle the error if the input is not a valid integer.
    print('Invalid input. Please enter a valid integer.');
  }
}

/// Generates a multiplication table for the first 10 multiples of the given [number].
/// Also computes and prints the sum of all the numbers in the table.
void generateMultiplicationTable(int number) {
  int sum = 0;

  print('Multiplication table for $number:');

  // Loop through the first 10 multiples.
  for (int i = 1; i <= 10; i++) {
    int result = number * i;
    print('$number x $i = $result');
    sum += result; // Add the result to the sum.
  }

  // Print the sum of the numbers in the table.
  print('Sum of the numbers in the multiplication table: $sum');
}