import 'package:flutter/material.dart';
import 'package:flutter_pi_app/config/constants.dart';
import 'package:flutter_pi_app/viewmodels/pi-config.viewmodel.dart';
import 'package:flutter_pi_app/widgets/filled-card.widget.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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
          title: const Text(Config.homePageTitle),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: const <Widget>[
            FilledCard(
              title: 'First card',
              subtitle:
                  'Keep in touch with your friends and family with free international chats, calls, and even games. Landkit connects you with the world.',
              icon: Icons.computer_rounded,
              buttonText: 'Next',
            ),
            FilledCard(
              title: 'First card',
              subtitle: 'Sub title here',
              icon: Icons.computer_rounded,
              buttonText: 'Next',
            ),
            FilledCard(
              title: 'First card',
              subtitle: 'Sub title here',
              icon: Icons.computer_rounded,
              buttonText: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
