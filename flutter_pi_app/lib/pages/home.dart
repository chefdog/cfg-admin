import 'package:flutter_pi_app/mixins/sidenav.dart';
import 'package:flutter_pi_app/widgets/widget_dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SideNav, DashBoardWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: getDrawer(Theme.of(context)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getCards(context),
          ],
        ),
      ),
    );
  }
}
