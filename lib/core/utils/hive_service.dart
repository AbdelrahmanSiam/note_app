import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/models/note_model.dart';

class HiveService {
  final Box<NoteModel> notesBox;

  HiveService({required this.notesBox});
  // 1- add note
  void addNote(NoteModel noteModel) {
    notesBox.add(noteModel);
  }

  // 2- Fetch all notes
  List<NoteModel> fetchAllNotes() {
    return notesBox.values.toList();
  }

  //3- edit note
  void editNote(int index, NoteModel noteModel) {
    notesBox.putAt(index, noteModel);
  }

  // 4- delete note
  void deleteNote(int index) {
    notesBox.deleteAt(index);
  }
}
