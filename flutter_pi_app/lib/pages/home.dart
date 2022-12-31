import 'package:flutter_pi_app/mixins/sidenav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pi_app/models/result.model.dart';
import 'package:flutter_pi_app/models/system-information.model.dart';
import 'package:flutter_pi_app/services/sys-info.service.dart';
import '../widgets/dashboard-card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SideNav {
  final RestorableBool isSelected = RestorableBool(false);
  late Future<Result> futureResultModel;

  // @override
  // String get restorationId => 'dashboard';

  // @override
  // void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
  //   registerForRestoration(isSelected, 'is_selected');
  // }

  // @override
  // void dispose() {
  //   isSelected.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    futureResultModel = fetchSysInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: getDrawer(Theme.of(context)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(32),
            child: FutureBuilder<Result>(
              future: futureResultModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var result = snapshot.data;
                  if (result != null) {
                    List<Object> si = result.data;
                    List<DashboardCarWidget> widgets = [];
                    for (final item in si) {
                      widgets.add(DashboardCarWidget(
                          title: item.environment, subTitle: ''));
                    }
                  }
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ]),
      ),
    );
  }
}


// child: Row(children: [
            //   for (final card in cards(context))
            //     Expanded(
            //       child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               padding: const EdgeInsets.only(bottom: 8),
            //               child: DashboardCarItem(
            //                 card: card,
            //               ),
            //             ),
            //           ]),
            //     ),
            // ]