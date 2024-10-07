import 'package:cf_exam/views/Home/home_page.dart';
import 'package:cf_exam/views/detail/detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail': (context) => const DetailPage(),
      },
    );
  }
}
