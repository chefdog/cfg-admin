
import 'package:flutter/material.dart';
import '../mixins/sidenav.dart';
import '../models/Health.model.dart';
import '../services/health.service.dart';

class PiDetailsPage extends StatefulWidget {
  const PiDetailsPage({super.key, required this.title});
  final String title;

  @override
  State<PiDetailsPage> createState() => _PiDetailsPageState();
}

class _PiDetailsPageState extends State<PiDetailsPage> with SideNav {
  late Future<Health> futureHealthModel;

  @override
  void initState() {
    super.initState();
    futureHealthModel = fetchModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: getDrawer(Theme.of(context)),
      body: Center(
        child: FutureBuilder<Health>(
          future: futureHealthModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.environment);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
