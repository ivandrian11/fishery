import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showError(String message) {
  Get.snackbar(
    'Error',
    message,
    backgroundColor: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 1),
  );
}
