import 'package:flutter/material.dart';
import 'package:flutter_pi_app/config/constants.dart';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/viewmodels/pi-config.viewmodel.dart';
import 'package:flutter_pi_app/widgets/filled-card.widget.dart';
import 'package:flutter_pi_app/widgets/outlined-card.widget.dart';
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
        body: FutureBuilder<List<PiConfig>>(
            future: model.piConfigs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (builderContext, index) {
                      //  final item = snapshot.data!.;
                      return const FilledCard(
                        title: 'title',
                        subtitle:
                            'Keep in touch with your friends and family with free international chats, calls, and even games. Landkit connects you with the world.',
                        icon: Icons.computer_rounded,
                        buttonText: 'Next',
                      );
                    });
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
