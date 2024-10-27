import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  // * Boilerplate jangan dihafal, karena kodingan itu soal logika
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
