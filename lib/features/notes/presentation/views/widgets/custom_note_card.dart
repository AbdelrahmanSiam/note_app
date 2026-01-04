import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/features/notes/presentation/views/edite_note.dart';
import 'package:note_app/features/search/presentation/manager/search_note_cubit/search_note_cubit.dart';

class CustomNoteCard extends StatelessWidget {
  const CustomNoteCard({
    super.key,
    required this.note,
    this.onDelete,
  });
  final NoteModel note;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => EditNote(note: note),
  ),
).then((_) {
  BlocProvider.of<SearchNoteCubit>(context).refreshSearch();
});

      },
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(fontSize: 26, color: Colors.black),
                ),
                subtitle: Text(
                  note.content,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 22, color: Colors.black.withOpacity(0.6)),
                ),
                trailing: IconButton(
                  onPressed: onDelete ?? () {
                    BlocProvider.of<NotesCubit>(context)
                        .deleteNote(note); // to fetch all notes after delete
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ),
              Spacer(),
              Text(
                note.date,
                style: TextStyle(
                    fontSize: 22, color: Colors.black.withOpacity(0.6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//                  MY last code
// Container(
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 26,
//                       color: Colors.black),
//                 ),
//                 Spacer(),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.delete,
//                     size: 30,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               subTitle,
//               style:
//                   TextStyle(fontSize: 22, color: Colors.black.withOpacity(0.6)),
//             ),
//             Spacer(),
//             Text(
//               "May 21/2025",
//               style:
//                   TextStyle(fontSize: 22, color: Colors.black.withOpacity(0.6)),
//             ),
//           ],
//         ),
//       ),
//     );
