import 'package:flutter/material.dart';
import 'package:flutter_pi_app/config/constants.dart';
import 'package:flutter_pi_app/services/service_locator.dart';
import 'package:flutter_pi_app/themes/dark_color_scheme.dart';
import 'package:flutter_pi_app/themes/light_color_scheme.dart';
import 'package:flutter_pi_app/views/dashboard.view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const DashboardView(),
    );
  }
}
