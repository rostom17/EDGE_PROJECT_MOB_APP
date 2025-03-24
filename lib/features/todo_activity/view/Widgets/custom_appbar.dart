import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
    this.isDrawer = false,
    this.isBackButton = false,
  });

  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final bool isDrawer;
  final bool isBackButton;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          if (isDrawer) {
            Scaffold.of(context).openDrawer();
          }
          if (isBackButton) {
            Get.back();
          }
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
