import 'package:cfg_admin/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'mixins/admin_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with AdminTheme {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CFG ADMIN',
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: const HomePage(title: 'DASHBOARD'),
    );
  }
}
