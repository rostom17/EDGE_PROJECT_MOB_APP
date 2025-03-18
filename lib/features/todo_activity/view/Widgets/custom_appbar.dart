import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
    this.isDrawer = false,
  });

  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final bool isDrawer;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(leadingIcon),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            label: Text("2"),
            backgroundColor: Colors.blue,
            child: Icon(trailingIcon),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
