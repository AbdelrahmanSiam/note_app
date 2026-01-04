import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_note_card.dart';
class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = [];

        if (state is NotesSuccessState) {
          notes = state.notes;
        }

        if (notes.isEmpty) {
          return const Center(child: Text("No notes found"));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomNoteCard(note: notes[index] , index: index,),
              );
            },
          ),
        );
      },
    );
  }
}
