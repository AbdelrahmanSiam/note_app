import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';
import 'package:note_app/features/notes/data/repo/note_repo_implementaion.dart';

part 'search_note_state.dart';

class SearchNoteCubit extends Cubit<SearchNoteState> {
  SearchNoteCubit(this.noteRepo) : super(SearchNoteInitial());

  final NoteRepo noteRepo;

  void searchNote(String qurey) {
    final notes = noteRepo.getAllNotes();
    final filter = notes.where((note){
      return note.title.toLowerCase().contains(qurey.toLowerCase()) || note.content.toLowerCase().contains(qurey.toLowerCase());}).toList();
      emit(SearchNoteSuccessState(searchNotes: filter));
    }
  }
