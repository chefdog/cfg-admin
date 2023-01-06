import 'package:flutter/material.dart';
import 'package:flutter_pi_app/config/constants.dart';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/viewmodels/pi-config.viewmodel.dart';
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
        body: Center(
          child: FutureBuilder<List<PiConfig>>(
            future: model.piConfigs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.requireData.length,
                    itemBuilder: (builderContext, index) {
                      final item = snapshot.requireData[index];
                      return ListTile(
                        title: Text(item.ipaddress),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
