import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_note_card.dart';
import 'package:note_app/features/notes/presentation/views/widgets/note_list_view.dart';
import 'package:note_app/features/search/presentation/manager/search_note_cubit/search_note_cubit.dart';
import 'package:note_app/features/search/presentation/views/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          SearchTextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<SearchNoteCubit>(context).searchNote(value);
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: BlocBuilder<SearchNoteCubit, SearchNoteState>(
              builder: (context, state) {
                if (state is SearchNoteSuccessState) {
                  if (state.searchNotes.isEmpty) {
                    return const Center(
                      child: Text(
                        'No notes found ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.searchNotes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomNoteCard(
  note: state.searchNotes[index],
  onDelete: () {
    context.read<NotesCubit>().deleteNote(state.searchNotes[index]);
    context.read<SearchNoteCubit>().refreshSearch();
  },
),

                      );
                    },
                  );
                } else if (state is SearchNoteInitial) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 120,
                            backgroundImage:
                                AssetImage("assets/images/download (1).jpeg")),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Start typting to search...."),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
