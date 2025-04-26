import 'dart:math';

/// A utility class for password operations, including validation and generation.
class PasswordUtils {
  /// Validates the strength of a password based on predefined criteria.
  ///
  /// Returns `true` if the password meets the minimum length, contains at
  /// least one uppercase letter, one lowercase letter, one digit, and one
  /// special character. Otherwise, returns `false`.
  static bool validatePassword(String password) {
    if (password.length < 8) {
      return false; // Minimum length not met
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false; // No uppercase letter
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return false; // No lowercase letter
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false; // No digit
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false; // No special character
    }
    return true; // All criteria met
  }

  /// Generates a strong password with a mix of uppercase, lowercase, digits,
  /// and special characters.
  ///
  /// The length of the password is determined by the [length] parameter.  A
  /// longer password is more secure.
  static String generateStrongPassword({int length = 16}) {
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const digits = '0123456789';
    const specialChars = r'!@#$%^&*(),.?":{}|<>';

    final allChars = uppercase + lowercase + digits + specialChars;
    final random = Random.secure();

    return List.generate(length, (index) => allChars[random.nextInt(allChars.length)]).join();
  }

  /// Generates an intermediate password with a mix of lowercase, digits and
  /// some special characters.
  ///
  /// The length of the password is determined by the [length] parameter.
  static String generateIntermediatePassword({int length = 12}) {
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const digits = '0123456789';
    const specialChars = r'!@#';

    final allChars = lowercase + digits + specialChars;
    final random = Random.secure();

    return List.generate(length, (index) => allChars[random.nextInt(allChars.length)]).join();
  }

  /// Generates a low password with only lowercase and digits. This type of
  /// password is not recommended for sensitive data.
  ///
  /// The length of the password is determined by the [length] parameter.
  static String generateLowPassword({int length = 8}) {
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const digits = '0123456789';

    final allChars = lowercase + digits;
    final random = Random.secure();

    return List.generate(length, (index) => allChars[random.nextInt(allChars.length)]).join();
  }
}

void main() {
  // Example Usage
  String strongPassword = PasswordUtils.generateStrongPassword();
  print('Strong Password: $strongPassword');
  print('Is Strong Password valid? ${PasswordUtils.validatePassword(strongPassword)}');

  String intermediatePassword = PasswordUtils.generateIntermediatePassword();
  print('Intermediate Password: $intermediatePassword');
  print('Is Intermediate Password valid? ${PasswordUtils.validatePassword(intermediatePassword)}');

  String lowPassword = PasswordUtils.generateLowPassword();
  print('Low Password: $lowPassword');
  print('Is Low Password valid? ${PasswordUtils.validatePassword(lowPassword)}');

  String customPassword = 'MyPassword123!';
  print('Is "$customPassword" valid? ${PasswordUtils.validatePassword(customPassword)}');
}