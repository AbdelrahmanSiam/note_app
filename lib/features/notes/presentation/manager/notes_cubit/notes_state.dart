part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitialState extends NotesState {}

final class NotesSuccessState extends NotesState {
  final List<NoteModel> notes;

  NotesSuccessState({required this.notes});
}

final class NotesLoadingState extends NotesState {}
