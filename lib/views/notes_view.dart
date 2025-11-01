import 'package:flutter/material.dart';
import 'package:note_app/views/notes_view_body.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_floating_action_button.dart';
import 'package:note_app/widgets/custom_note_card.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      body: NotesViewBody(),
    );
  }
}
