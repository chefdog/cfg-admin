import 'package:flutter/material.dart';

import '../pages/pi_details.dart';

mixin DashBoardWidget {
  Widget getCards(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: 
                ),
              ],
            ),
          ),
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.important_devices,
                            color: Colors.green,
                          ),
                          title: Text('Raspberry pi 02'),
                          subtitle: Text(
                            'State: connected',
                            selectionColor: Colors.blue,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('DETAILS'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.important_devices,
                            color: Colors.green,
                          ),
                          title: Text('Raspberry pi 03'),
                          subtitle: Text(
                            'State: connected',
                            selectionColor: Colors.blue,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('DETAILS'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
