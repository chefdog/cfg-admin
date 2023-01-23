import 'package:flutter/material.dart';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/viewmodels/pi-config.viewmodel.dart';
import 'package:flutter_pi_app/widgets/filled-card.widget.dart';
import 'package:stacked/stacked.dart';

class DashboardCardList extends StatelessWidget {
  const DashboardCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PiConfigViewModel>.reactive(
      viewModelBuilder: () {
        final viewModel = PiConfigViewModel();
        viewModel.loadData();
        return viewModel;
      },
      builder: (context, model, child) => Scaffold(
        body: FutureBuilder<List<PiConfig>>(
            future: model.piConfigs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (builderContext, int index) {
                    final item = snapshot.requireData[index];

                    return FilledCard(
                      title: item.ipAddress,
                      subtitle: '',
                      icon: Icons.computer_rounded,
                      buttonText: 'Next',
                    );
                  },
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
