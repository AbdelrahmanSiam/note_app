import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';
import 'package:note_app/features/notes/data/repo/note_repo_implementaion.dart';

part 'search_note_state.dart';
class SearchNoteCubit extends Cubit<SearchNoteState> {
  SearchNoteCubit(this.noteRepo) : super(SearchNoteInitial());

  final NoteRepo noteRepo;
  String _lastQuery = '';

  void searchNote(String query) {
    _lastQuery = query;

    final notes = noteRepo.getAllNotes();
    final filtered = notes.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase()) ||
             note.content.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(SearchNoteSuccessState(searchNotes: filtered));
  }

  void refreshSearch() {
    if (_lastQuery.isNotEmpty) {
      searchNote(_lastQuery);
    }
  }
}
