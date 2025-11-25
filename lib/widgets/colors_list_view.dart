
import 'package:flutter/widgets.dart';
import 'package:note_app/widgets/color_item.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 36, // 2* radius of circularAvatar
      child: ListView.builder(
          padding: EdgeInsets.all(2),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ColorItem();
          }),
    );
  }
}