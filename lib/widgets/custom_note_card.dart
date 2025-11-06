import 'package:flutter/material.dart';
import 'package:note_app/views/edite_note.dart';

class CustomNoteCard extends StatelessWidget {
  const CustomNoteCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.cardColor,
  });
  final String title;
  final String subTitle;
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditeNote(),
          ),
        );
      },
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  title,
                  style: TextStyle(fontSize: 26, color: Colors.black),
                ),
                subtitle: Text(
                  subTitle,
                  style: TextStyle(
                      fontSize: 22, color: Colors.black.withOpacity(0.6)),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "May 21/2025",
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
