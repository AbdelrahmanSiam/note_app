import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_note_card.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomNoteCard(
                title: "title",
                subTitle: "subTitle",
                cardColor: Colors.yellowAccent),
          );
        },
      ),
    );
  }
}
