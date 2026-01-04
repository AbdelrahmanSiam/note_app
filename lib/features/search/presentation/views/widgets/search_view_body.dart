import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_note_card.dart';
import 'package:note_app/features/notes/presentation/views/widgets/note_list_view.dart';
import 'package:note_app/features/search/presentation/manager/search_note_cubit/search_note_cubit.dart';
import 'package:note_app/features/search/presentation/views/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          note: state.searchNotes[index], index: index),
                    );
                  },
                );
              } else if (state is SearchNoteInitial) {
                return const Center(
                  child: Text(
                    'Start typing to search...',
                    style: TextStyle(color: Colors.grey),
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
    );
  }
}
