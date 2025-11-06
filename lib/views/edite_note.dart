import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditeNote extends StatelessWidget {
  const EditeNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icon(Icons.check),
            ),
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
          ],
        ),
      ),
    );
  }
}
