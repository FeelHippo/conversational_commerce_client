import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardUtils {
  void hideKeyBoard({required BuildContext context}) {
    FocusScope.of(context).requestFocus(FocusNode());
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
