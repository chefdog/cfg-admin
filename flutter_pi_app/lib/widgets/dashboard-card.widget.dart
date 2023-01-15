import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon})
      : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Card(
        elevation: 8.0,
        margin: const EdgeInsets.all(4.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(icon),
        ),
      ),
    );
  }
}
