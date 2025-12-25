mixin Validator {
  ///change validation according to requirements. This is just for reference
  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    } else if (!RegExp(r'^(?:\+91|0)?[6-9]\d{9}$').hasMatch(value)) {
      return "Please enter a valid Indian phone number";
    }
    return null;
  }

  String? validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Email or phone number is required";
    }

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final indianPhoneRegex = RegExp(r'^(?:\+91|0)?[6-9]\d{9}$');

    if (!emailRegex.hasMatch(value) && !indianPhoneRegex.hasMatch(value)) {
      return "Please enter a valid email or Indian phone number";
    }

    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 4) {
      return "Password must be 4 characters";
    }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    } else if (value != password) {
      return "Confirm password does not match";
    }
    return null;
  }

  // Name validation
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    } else if (value.length < 3 || value.length > 50) {
      return "Name should be atleast 3 character long";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9]').hasMatch(value)) {
      return "Please enter valid name";
    }
    return null;
  }

  String? validateOtp(String? otp) {
    bool isValid = otp?.isNotEmpty ?? false;
    return isValid ? null : "";
  }

  String? validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return "Message is required";
    }
    return null;
  }
}
