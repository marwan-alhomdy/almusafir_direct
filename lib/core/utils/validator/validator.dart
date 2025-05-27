extension ValidatorX on String {
  String? Function(String?)? validator() {
    return (value) {
      if (value != null && value.isNotEmpty) {
        return null;
      } else {
        return this;
      }
    };
  }

  String? Function(dynamic)? validatorDropDown() {
    return (value) {
      if (value != null) {
        return null;
      } else {
        return this;
      }
    };
  }

  String? Function(String?)? validatorMobile() {
    return (value) {
      if (value != null && value.isNotEmpty && value.length == 9) {
        return null;
      } else {
        return "";
      }
    };
  }
}
