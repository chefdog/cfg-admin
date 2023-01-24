import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(child: Text('Elevated Card')),
      ),
    );
  }
}
