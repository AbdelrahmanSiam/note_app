import 'package:note_app/core/models/note_model.dart';

abstract class NoteRepo {
  void addNote(NoteModel noteModel);
  List<NoteModel> getAllNotes();
  void editNote(int index , NoteModel noteModel);
  void deleteNote(int index);
}
