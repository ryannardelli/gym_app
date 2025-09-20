import 'package:flutter/material.dart';

InputDecoration getAuthInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    filled: true,
    fillColor: Colors.white,

    errorStyle: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  );
}
