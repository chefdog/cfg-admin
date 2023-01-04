import 'package:flutter/material.dart';
import 'package:flutter_pi_app/services/service_locator.dart';
import 'mixins/admin_theme.dart';
import 'pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with AdminTheme {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CFG PI ADMIN',
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: const HomePage(title: 'DASHBOARD'),
    );
  }
}
