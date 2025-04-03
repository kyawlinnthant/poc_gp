class FormValidator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Please enter your email";
    }
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Please enter your password";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? validateConfirmPassword({
    required String password,
    required String confirmPassword,
  }) {
    if (confirmPassword.isEmpty) {
      return "Please enter your password";
    }
    if (password != confirmPassword) {
      return "Confirm password does not match";
    }
    return null;
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return "Please enter your name";
    }
    if (name.length > 30) {
      return "Name must be at most 30 characters";
    }
    return null;
  }

  static String? validateMobileNumber(String mobileNumber) {
    if (mobileNumber.isEmpty) {
      return "Please enter your mobile number";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(mobileNumber)) {
      return "Mobile number must contain only digits";
    }
    if (mobileNumber.length < 8 || mobileNumber.length > 15) {
      return "Mobile number must be between 8 and 15 digits";
    }
    return null;
  }
}
