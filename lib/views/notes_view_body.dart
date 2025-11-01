import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_note_card.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(),
          Expanded(
            child: ListView(
              children: [
                CustomNoteCard(
                    title: "Flutter Tips",
                    subTitle: "subTitle",
                    cardColor: Colors.yellowAccent),
                SizedBox(
                  height: 10,
                ),
                CustomNoteCard(
                    title: "Nour",
                    subTitle: "Noru is a good girl.",
                    cardColor: Colors.deepOrange),
                SizedBox(
                  height: 10,
                ),
                CustomNoteCard(
                    title: "Abdulrahman",
                    subTitle: "He is Nour brother.",
                    cardColor: Colors.lightGreenAccent),
                SizedBox(
                  height: 10,
                ),
                CustomNoteCard(
                    title: "Abdoooooz",
                    subTitle: "subTitle",
                    cardColor: Colors.deepPurpleAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
