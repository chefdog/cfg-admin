import 'package:cfg_admin/mixins/sidenav.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SideNav {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: getDrawer(Theme.of(context)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleSection,
          ],
        ),
      ),
    );
  }
}
