class InputTypeHelper {
  static bool isEmail(String input) {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return emailRegex.hasMatch(input.trim());
  }

  static bool isPhone(String input) {
    final phoneRegex = RegExp(r'^\+?\d{7,15}$');
    return phoneRegex.hasMatch(input.trim());
  }
}
