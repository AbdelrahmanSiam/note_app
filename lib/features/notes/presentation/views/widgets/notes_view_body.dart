import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utils/service_locater.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';
import 'package:note_app/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:note_app/features/search/presentation/manager/search_note_cubit/search_note_cubit.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_app_bar.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_note_card.dart';
import 'package:note_app/features/notes/presentation/views/widgets/note_list_view.dart';
import 'package:note_app/features/search/presentation/views/search_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => SearchNoteCubit(getIt.get<NoteRepo>()),
                            child: SearchView(),
                          )));
            },
            title: "XNote",
            icon: Icon(Icons.search),
          ),
          Expanded(child: NoteListView()),
        ],
      ),
    );
  }
}
