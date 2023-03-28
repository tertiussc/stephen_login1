class ValidationMixin {
  String? validateEmail(value) {
    if (!value!.contains('@')) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.length < 4) {
      return 'Invalid Password, must be 4 or more characters';
    }
    return null;
  }
}
