import 'package:flutter/material.dart';
import 'package:flutter_pi_app/config/constants.dart';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/viewmodels/pi-config.viewmodel.dart';
import 'package:flutter_pi_app/widgets/filled-card.widget.dart';
import 'package:flutter_pi_app/widgets/screen-title.widget.dart';
import 'package:flutter_pi_app/widgets/splash-image.widget.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardStateWidget();
}

class _DashboardStateWidget extends State<DashboardView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PiConfigViewModel>.reactive(
      viewModelBuilder: () {
        final viewModel = PiConfigViewModel();
        viewModel.loadData();
        return viewModel;
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            // title: const Text(Config.homePageTitle),
            ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_rounded),
              label: 'Add new pi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: FutureBuilder<List<PiConfig>>(
          future: model.piConfigs,
          builder: (context, snapshot) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data == null ? 2 : snapshot.data!.length + 2,
              itemBuilder: (builderContext, int index) {
                if (index == 0) {
                  return const Center(
                    child: ScreenTitle(
                      title: Config.splashWelcome,
                    ),
                  );
                }
                if (index == 1) {
                  return const Center(
                    child: SplashImage(
                      imageAsset: "images/pi-splash.png",
                      imageWidth: 334,
                      imageHeight: 200,
                    ),
                  );
                }

                index -= 2;
                if (snapshot.hasData) {
                  final item = snapshot.requireData[index];
                  return Center(
                    child: FilledCard(
                      id: item.id,
                      title: item.ipAddress,
                      icon: Icons.stars,
                      subtitle: item.description,
                      buttonText: 'edit',
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            );
          },
        ),
      ),
    );
  }
}
