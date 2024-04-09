import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleBar;
  const CustomAppBar({super.key, required this.titleBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title:  Text(
        titleBar,
        style:  const TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
  
  @override
 // Returns the preferred size of the app bar, using the standard toolbar height

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
