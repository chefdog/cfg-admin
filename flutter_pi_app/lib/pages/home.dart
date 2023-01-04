import 'package:flutter_pi_app/mixins/sidenav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pi_app/models/result.model.dart';
import 'package:flutter_pi_app/viewmodels/pi-config.viewmodel.dart';
import '../config/constants.dart';
import '../widgets/dashboard-card-list-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SideNav {
  final RestorableBool isSelected = RestorableBool(false);
  late Future<Result> futureResultModel;

  @override
  void initState() {
    super.initState();
    final vm = PiConfigViewModel();
    vm.loadData();
    // futureResultModel = fetchSysInfo('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.homePageTitle),
      ),
      drawer: getDrawer(Theme.of(context)),
      body: Center(
        child: FutureBuilder<Result>(
          future: futureResultModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DashboardCardListViewWidget(result: snapshot.requireData);
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
