
import 'package:flutter/material.dart';
import 'package:my_todo_list/core/color_pallet.dart';

class HomePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ROSTOM ALI", style: Theme.of(context).textTheme.titleMedium),
          Text("May 5, 2025", style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: ColorPallet.primaryThemeColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.person_2_rounded, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}