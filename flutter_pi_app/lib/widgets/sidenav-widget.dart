import 'package:flutter/material.dart';

class SideNav {
  static ListView get sideNav {
    return ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(),
          child: Text(
            'CHEFDOG',
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        AboutListTile(
          icon: Icon(Icons.info),
          applicationIcon: FlutterLogo(),
          applicationName: 'About this app',
          applicationVersion: 'August 2019',
          applicationLegalese: '\u{a9} 2014 The Flutter Authors',
          // aboutBoxChildren: aboutBoxChildren,
        ),
      ],
    );
  }
}
