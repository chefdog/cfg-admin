import 'package:flutter/material.dart';
import 'package:flutter_pi_app/views/product-detail.view.dart';

class FilledCard extends StatelessWidget {
  const FilledCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.subtitle,
      required this.buttonText,
      required this.icon})
      : super(key: key);

  final int id;
  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.air),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: Text(buttonText),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailView(
                          productId: id,
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
      ),
    );
  }
}
