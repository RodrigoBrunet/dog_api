import 'package:flutter/material.dart';

class SnackBarMessageSavedDataBase {
  static void showDogSavedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dog saved in favorites')),
    );
  }
}
