import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());

  fetchAllNotes() async {
    try {
      var notes = Hive.box<NoteModel>(notesBox);
      emit(NotesSuccessState(notes: notes.values.toList()));
    } catch (e) {
      emit(NotesFailureState(errMsg: e.toString()));
    }
  }
}
