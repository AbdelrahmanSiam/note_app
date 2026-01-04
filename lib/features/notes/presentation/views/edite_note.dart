import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utils/service_locater.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';
import 'package:note_app/features/notes/data/repo/note_repo_implementaion.dart';
import 'package:note_app/features/notes/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/features/notes/presentation/views/widgets/color_item.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_app_bar.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_text_field.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, content;
  int? selectedColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddNoteCubit(getIt.get<NoteRepo>()),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccessState) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
          if (state is AddNoteFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      CustomAppBar(
                        onPressed: () {
                          BlocProvider.of<AddNoteCubit>(context).updateNote(
                            widget.note,
                            newTitle: title,
                            newContent: content,
                            newColor: selectedColor,
                          );
                        },
                        title: 'Edit Note',
                        icon: Icon(Icons.check),
                      ),
                      SizedBox(height: 30),
                      CustomTextFormField(
                        hintText: widget.note.title,
                        onChanged: (value) => title = value,
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        hintText: widget.note.content,
                        maxLines: 6,
                        onChanged: (value) => content = value,
                      ),
                      SizedBox(height: 20),
                      EditNoteColorsListView(
                        note: widget.note,
                        onColorChanged: (color) => selectedColor = color,
                      ),
                      SizedBox(height: 120),
                      if (state is AddNoteLoadingState)
                        CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({super.key, required this.note, required this.onColorChanged});
  final NoteModel note;
  final Function(int) onColorChanged;

  @override
  State<EditNoteColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<EditNoteColorsListView> {
  late int currentIndex;
  final List<Color> colors = [
    Color(0xFF6D28D9),
    Color(0xFF1E3A8A),
    Color(0xFF0F766E),
    Color(0xFF065F46),
    Color(0xFF92400E),
    Color(0xFF7C2D12),
  ];

  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                setState(() => currentIndex = index);
                widget.onColorChanged(colors[index].value);
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
