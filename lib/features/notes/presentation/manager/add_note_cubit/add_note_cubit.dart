import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';
import 'package:note_app/features/notes/data/repo/note_repo_implementaion.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final NoteRepo noteRepo;

  AddNoteCubit(this.noteRepo) : super(AddNoteInitialState());

  Color color = const Color(0xFF1E3A8A);

  void addNote(NoteModel noteModel) {
    emit(AddNoteLoadingState());

    try {
      final note = NoteModel(
        color.value,
        noteModel.title,
        noteModel.content,
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
      );

      noteRepo.addNote(note);
      emit(AddNoteSuccessState(note: note)); // ممكن تبعث الـ note الجديد
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }

  void updateNote(
    NoteModel note, {
    String? newTitle,
    String? newContent,
    int? newColor,
  }) async {
    note.title = newTitle ?? note.title;
    note.content = newContent ?? note.content;
    note.color = newColor ?? note.color;

    await note.save();
    emit(AddNoteSuccessState(note: note));
  }
}
