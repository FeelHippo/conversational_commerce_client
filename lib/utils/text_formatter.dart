import 'package:flutter/services.dart';

class Formatters {
  static FilteringTextInputFormatter denySpecialChar =
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'));
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
