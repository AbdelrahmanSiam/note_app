import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:note_app/features/notes/presentation/views/widgets/notes_view_body.dart';
import 'package:note_app/features/notes/presentation/views/widgets/add_note_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddNoteButtomSheet());
        },
        backgroundColor: Colors.cyan,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: NotesViewBody(),
    );
  }
}
