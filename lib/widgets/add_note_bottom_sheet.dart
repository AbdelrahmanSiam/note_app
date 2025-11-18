import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_bottom_form.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(child: AddButtomForm()),
    );
  }
}
