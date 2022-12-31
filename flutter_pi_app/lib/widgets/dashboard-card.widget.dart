/* @see : https://gallery.flutter.dev/#/demo/card
 * 
*/

import 'package:flutter/material.dart';
import 'package:flutter_pi_app/widgets/sub-title.widget.dart';

import 'section-title.widget.dart';

class DashboardCarWidget extends StatelessWidget {
  const DashboardCarWidget(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(title: title),
            SubTitle(title: subTitle),
          ],
        ),
      ),
    );
  }
}
