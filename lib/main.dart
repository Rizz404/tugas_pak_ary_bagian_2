import 'package:flutter/material.dart';
import 'package:latihan_pak_ary_bagian_2/pages/latihan_2_1.dart';
import 'config/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas pak Ary bagian 2',
      home: const Latihan21(),
      theme: ikuyoTheme,
    );
  }
}
