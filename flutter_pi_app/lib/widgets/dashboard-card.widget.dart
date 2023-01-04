import 'package:flutter/material.dart';
import 'package:flutter_pi_app/models/system-information.model.dart';
import 'package:flutter_pi_app/widgets/sub-title.widget.dart';
import 'section-title.widget.dart';

class DashboardCarWidget extends StatelessWidget {
  const DashboardCarWidget({Key? key, required this.model}) : super(key: key);

  final SystemInformation model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(title: model.machineName),
            const SubTitle(title: ''),
          ],
        ),
      ),
    );
  }
}
