import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/core/utils/service_locater.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';
import 'package:note_app/features/notes/data/repo/note_repo_implementaion.dart';
import 'package:note_app/features/notes/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/core/utils/simple_bloc_observer.dart';
import 'package:note_app/features/notes/presentation/views/notes_view.dart';

void main() async {
  await Hive.initFlutter(); //initialize Hive
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(notesBox); // open box called (notesBox)
  setupLocator();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(getIt.get<NoteRepo>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins'), // to make all fonts in the app is poppins
        home: NotesView(),
      ),
    );
  }
}
