import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthState extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  void reset() {
    email.clear();
    password.clear();
  }
}
