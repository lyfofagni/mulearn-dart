import 'dart:io';
import 'dart:math';
import 'package:args/args.dart';

class PasswordManager {
  static final RegExp _lowerCase = RegExp(r'[a-z]');
  static final RegExp _upperCase = RegExp(r'[A-Z]');
  static final RegExp _number = RegExp(r'[0-9]');
  static final RegExp _specialChar = RegExp(r'[!@#\$%^&*()_+\[\]{}]');

  static String validatePasswordStrength(String password) {
    bool hasLower = _lowerCase.hasMatch(password);
    bool hasUpper = _upperCase.hasMatch(password);
    bool hasNumber = _number.hasMatch(password);
    bool hasSpecial = _specialChar.hasMatch(password);

    int length = password.length;

    if (length >= 8 && hasLower && hasUpper && hasNumber && hasSpecial) {
      return "Strong";
    } else if (length >= 6 && hasLower && hasUpper && hasNumber) {
      return "Intermediate";
    } else {
      return "Low";
    }
  }

  static String generatePassword(String level) {
    const lower = 'abcdefghijklmnopqrstuvwxyz';
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const specials = '!@#\$%^&*()_+[]{}';

    String chars = '';
    int length = 8;

    switch (level.toLowerCase()) {
      case 'strong':
        chars = lower + upper + numbers + specials;
        length = 12;
        break;
      case 'intermediate':
        chars = lower + upper + numbers;
        length = 10;
        break;
      case 'low':
        chars = lower;
        length = 6;
        break;
      default:
        throw ArgumentError('Invalid level. Choose strong, intermediate, or low.');
    }

    final rand = Random();
    return List.generate(length, (_) => chars[rand.nextInt(chars.length)]).join();
  }
}

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('validate', abbr: 'v', help: 'Validate password strength')
    ..addOption('generate', abbr: 'g', help: 'Generate a password with level (strong, intermediate, low)')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage');

  final argResults = parser.parse(arguments);

  if (argResults['help'] as bool || arguments.isEmpty) {
    print('Password Manager Utility');
    print(parser.usage);
    exit(0);
  }

  if (argResults.wasParsed('validate')) {
    final input = argResults['validate'] as String;
    final strength = PasswordManager.validatePasswordStrength(input);
    print('Password Strength: $strength');
  }

  if (argResults.wasParsed('generate')) {
    final level = argResults['generate'] as String;
    try {
      final password = PasswordManager.generatePassword(level);
      print('Generated Password ($level): $password');
    } catch (e) {
      stderr.writeln('Error: ${e.toString()}');
      exit(1);
    }
  }
}
