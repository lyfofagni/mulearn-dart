import 'dart:io';

void main() {
  try {
    stdout.write('Enter the first number: ');
    String? input1 = stdin.readLineSync();
    if (input1 == null) {
      print('Error: No input received for the first number.');
      return;
    }
    double num1 = double.parse(input1);

    stdout.write('Enter the second number: ');
    String? input2 = stdin.readLineSync();
    if (input2 == null) {
      print('Error: No input received for the second number.');
      return;
    }
    double num2 = double.parse(input2);

    double sum = num1 + num2;

    print('The sum of $num1 and $num2 is: $sum');
    print('The sum of ' + num1.toString() + ' and ' + num2.toString() + ' is: ' + sum.toString());
  } catch (e) {
    print('Error: Invalid input. Please enter valid numbers.');
  }
}
