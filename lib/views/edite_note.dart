import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditeNote extends StatefulWidget {
  const EditeNote({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditeNote> createState() => _EditeNoteState();
}

class _EditeNoteState extends State<EditeNote> {
  String? title, content;
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
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icon(Icons.check),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextFormField(
                onChanged: (value) {
                  title = value;
                },
                hintText: widget.note.title),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                onChanged: (value) {
                  content = value;
                },
                hintText: widget.note.content,
                maxLines: 6),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
