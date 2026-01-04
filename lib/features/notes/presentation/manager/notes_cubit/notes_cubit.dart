import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';
import 'package:note_app/features/notes/data/repo/note_repo_implementaion.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.noteRepo) : super(NotesInitialState());

  final NoteRepo noteRepo;
  // List<NoteModel>? notes;
  // fetchAllNotes() {
  //   var box = Hive.box<NoteModel>(notesBox);
  //   notes = box.values.toList();
  //   emit(NotesSuccessState());
  // }

  void fetchAllNotes() {
    emit(NotesLoadingState());
    final notes = noteRepo.getAllNotes();
    emit(NotesSuccessState(notes: notes));
  }

  void deleteNotes(int index) {
    noteRepo.deleteNote(index);
    fetchAllNotes();
  }
}
