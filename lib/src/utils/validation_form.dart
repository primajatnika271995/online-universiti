class ValidationForm {
  ValidationForm._();

  static String validationCreditCardNumber(String value) {
    final RegExp creditCardExp = RegExp(r'^\d\d\d\d\ \d\d\d\d\ \d\d\d\d\$');
    if (!creditCardExp.hasMatch(value))
      return '#### #### #### ####';
    return null;
  }
}