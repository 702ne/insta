import 'package:flutter/material.dart';

import 'common_size.dart';

InputDecoration textInputDecor(String text) {
  return InputDecoration(
      hintText: text,
      enabledBorder: activeInputBorder(),
      focusedBorder: activeInputBorder(),
      errorBorder: errorInputBorder(),
      focusedErrorBorder: errorInputBorder(),
      filled: true,
      fillColor: Colors.grey[100]);
}

OutlineInputBorder errorInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red[300]!),
      borderRadius: BorderRadius.circular(common_s_gap));
}

OutlineInputBorder activeInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(common_s_gap));
}
