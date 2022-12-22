import 'package:flutter/material.dart';

import '../mixins/sidenav.dart';

class PiDetailsPage extends StatefulWidget {
  const PiDetailsPage({super.key, required this.title});
  final String title;
  @override
  State<PiDetailsPage> createState() => _PiDetailsPageState();
}

class _PiDetailsPageState extends State<PiDetailsPage> with SideNav {
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
          children: [],
        ),
      ),
    );
  }
}
