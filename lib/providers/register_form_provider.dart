import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  bool validate() {
    if (registerKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
