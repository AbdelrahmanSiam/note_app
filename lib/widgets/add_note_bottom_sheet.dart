import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_add_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomTextField(hintText: "Title"),
            SizedBox(
              height: 20,
            ),
            CustomTextField(hintText: "Content", maxLines: 6),
            SizedBox(
              height: 120,
            ),
            CustomAddButton(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
