import 'package:flutter/material.dart';
import 'package:note_app/views/notes_view_body.dart';
import 'package:note_app/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_note_card.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddNoteButtomSheet());
        },
        backgroundColor: Colors.cyan,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: NotesViewBody(),
    );
  }
}
