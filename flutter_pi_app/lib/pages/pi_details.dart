import 'package:flutter/material.dart';
import '../mixins/sidenav.dart';
import '../models/system-information.model.dart';

class PiDetailsPage extends StatefulWidget {
  const PiDetailsPage({super.key, required this.title});
  final String title;

  @override
  State<PiDetailsPage> createState() => _PiDetailsPageState();
}

class _PiDetailsPageState extends State<PiDetailsPage> with SideNav {
  late Future<List<SystemInformation>> futureModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: getDrawer(Theme.of(context)),
      body: Center(
        child: FutureBuilder<SystemInformation>(
          builder: (context, snapshot) {
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
