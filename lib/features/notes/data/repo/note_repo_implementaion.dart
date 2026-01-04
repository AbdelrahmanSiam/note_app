import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/core/utils/hive_service.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';

class NoteRepoImplementaion implements NoteRepo {
  final HiveService hiveService;

  NoteRepoImplementaion({required this.hiveService});
  @override
  void addNote(NoteModel noteModel) {
    hiveService.addNote(noteModel);
  }

  @override
  void deleteNote(int index) {
    hiveService.deleteNote(index);
  }

  @override
  void editNote(int index, NoteModel noteModel) {
    hiveService.editNote(index, noteModel);
  }

  @override
  List<NoteModel> getAllNotes() {
    return hiveService.fetchAllNotes();
  }
}
