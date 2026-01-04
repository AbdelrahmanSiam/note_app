part of 'search_note_cubit.dart';

@immutable
sealed class SearchNoteState {}

final class SearchNoteInitial extends SearchNoteState {}

final class SearchNoteSuccessState extends SearchNoteState {
  final List<NoteModel> searchNotes;

  SearchNoteSuccessState({required this.searchNotes});
}

final class SearchNoteLoadingState extends SearchNoteState {}

