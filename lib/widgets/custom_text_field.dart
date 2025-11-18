import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, required this.hintText, this.maxLines, this.onSaved});
  final String hintText;
  final void Function(String?)? onSaved;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
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
