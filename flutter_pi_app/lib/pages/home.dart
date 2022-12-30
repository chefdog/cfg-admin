import 'package:flutter_pi_app/mixins/sidenav.dart';
import 'package:flutter/material.dart';

import '../mocks/dashboard-card-data.dart';
import '../partials/dashboard_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RestorationMixin, SideNav {
  final RestorableBool isSelected = RestorableBool(false);

  @override
  String get restorationId => 'dashboard';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(isSelected, 'is_selected');
  }

  @override
  void dispose() {
    isSelected.dispose();
    super.dispose();
  }

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
            for (final card in cards(context))
              Container(
                padding: const EdgeInsets.all(32),
                child: Row(children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: DashboardCarItem(
                              card: card,
                            ),
                          ),
                        ]),
                  ),
                ]),
              ),
          ],
        ),
      ),
    );
  }
}
