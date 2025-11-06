import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, this.maxLines});
  final String hintText;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.cyan),
        border: OutlineInputBorderMethod(color: Colors.cyan),
        enabledBorder: OutlineInputBorderMethod(color: Colors.white),
        focusedBorder: OutlineInputBorderMethod(color: Colors.cyan),
      ),
    );
  }

  OutlineInputBorder OutlineInputBorderMethod({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}
