import 'package:flutter/material.dart';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/widgets/dashboard-card.widget.dart';

class DashboardCardListViewWidget extends StatelessWidget {
  const DashboardCardListViewWidget({Key? key, required this.result})
      : super(key: key);

  final List<PiConfig> result;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // for (final item in result)
            // DashboardCardWidget(title: item.machineName ?? '', image: '')
          ],
        ),
      ),
    );
  }
}
