/* @see : https://gallery.flutter.dev/#/demo/card
 * 
*/

import 'package:flutter/material.dart';
import 'package:flutter_pi_app/models/dashboard-card.model.dart';
import 'package:flutter_pi_app/widgets/sub-title.widget.dart';

import '../widgets/section-title.widget.dart';

class DashboardCarItem extends StatelessWidget {
  const DashboardCarItem({Key? key, required this.card}) : super(key: key);

  final DashboardCard card;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(title: card.title),
            SubTitle(title: card.subTitle),
          ],
        ),
      ),
    );
  }
}
