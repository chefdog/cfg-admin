/* @see : https://gallery.flutter.dev/#/demo/card
 * 
*/

import 'package:flutter/material.dart';

import '../pages/pi_details.dart';

class DashboardCard extends StatelessWidget {
  // fields
  final String title;
  final String subTitle;
  final MaterialAccentColor iconColor;
  final MaterialColor textSelectionColor;
  final String buttonText;
  // end fields

  const DashboardCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.iconColor,
      required this.textSelectionColor,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.important_devices,
              color: Colors.redAccent,
            ),
            title: Text(title),
            subtitle: Text(subTitle ?? ''),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('DETAILS'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PiDetailsPage(
                        title: 'pi 01 called',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardText extends State<Text> {
  @override
  Widget build(BuildContext context) {}
}
