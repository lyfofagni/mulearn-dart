//Agnivesh PS
/// A Dart program demonstrating dynamic data manipulation with lists and functions.
void main() {
  // Example list of numbers.
  List<int> numbers = [1, 2, 3, 4, 5];

  // Define various operations as functions.
  int doubleNumber(int number) => number * 2;
  int squareNumber(int number) => number * number;
  int addOne(int number) => number + 1;

  // Process the list with different operations.
  print('Doubling the numbers:');
  processList(numbers, doubleNumber);

  print('\nSquaring the numbers:');
  processList(numbers, squareNumber);

  print('\nAdding one to each number:');
  processList(numbers, addOne);

  // Demonstrate with a different list.
  List<int> otherNumbers = [6, 7, 8, 9, 10];

  print('\nDoubling the other numbers:');
  processList(otherNumbers, doubleNumber);
}

/// Processes a list of numbers by applying a given operation to each element.
///
/// Parameters:
///   numbers: A list of integers to be processed.
///   operation: A function that takes an integer and returns an integer,
///              representing the operation to be applied to each element.
void processList(List<int> numbers, int Function(int) operation) {
  for (int number in numbers) {
    int result = operation(number);
    print('Input: $number, Output: $result');
  }
}
