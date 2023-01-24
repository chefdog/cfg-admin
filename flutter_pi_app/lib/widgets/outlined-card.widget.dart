import 'package:flutter/material.dart';
import 'package:flutter_pi_app/views/product-detail.view.dart';

class OutlinedCard extends StatelessWidget {
  const OutlinedCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.buttonText,
      required this.icon})
      : super(key: key);

  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              iconColor: Theme.of(context).colorScheme.onPrimaryContainer,
              title: Text(title),
              subtitle: Text(subtitle),
              leading: Icon(icon),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(10),
                      // style: LightTheme.cardButtonStyle,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print('hallo');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
