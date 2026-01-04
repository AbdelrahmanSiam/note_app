import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/features/notes/presentation/views/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  final List<Color> colors = [
    Color(0xFF6D28D9), // deep blue
    Color(0xFF1E3A8A), // deep purple
    Color(0xFF0F766E), // deep teal
    Color(0xFF065F46), // deep green
    Color(0xFF92400E), // deep orange/brown
    Color(0xFF7C2D12), // deep burnt orange
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 36, // 2* radius of circularAvatar
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                  setState(() {});
                },
                child: ColorItem(
                  color: colors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
