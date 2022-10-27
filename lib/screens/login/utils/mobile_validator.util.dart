bool isValidMobileNumber(String mobileNumber) {
  if (mobileNumber.isEmpty) {
    return false;
  }

  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(mobileNumber)) {
    return false;
  }

  return true;
}
