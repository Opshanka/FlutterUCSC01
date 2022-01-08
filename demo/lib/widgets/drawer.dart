import 'package:demo/network/webservices.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Widget navDrawer(BuildContext context) {
  final menus = [
    'drawer.home'.tr(),
    'drawer.industries'.tr(),
    'drawer.users'.tr(),
    'drawer.add_user'.tr(),
    'drawer.logout'.tr(),
  ];

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'drawer.title'.tr(),
            style: Theme.of(context).textTheme.headline4,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          title: menuTile(context, menus[0]),
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[1]),
          onTap: () {
            Navigator.pushNamed(context, '/industries');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[2]),
          onTap: () {
            Navigator.pushNamed(context, '/users');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[3]),
          onTap: () {
            Navigator.pushNamed(context, '/add_user');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[4]),
          onTap: () {
            _logout(context);
          },
        ),
        separator(context),
      ],
    ),
  );
}

  void _logout(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://image.flaticon.com/icons/png/128/1252/1252006.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Sign out',
                  ),
                ),
              ],
            ),
            content: Text(
              'Do you wanna Sign out',
              style: Theme.of(context).textTheme.headline4,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text('Cancel',style: TextStyle(color: Colors.green),),
              ),
              TextButton(
                onPressed: () {
                  var isLogout = logout(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

Widget separator(BuildContext context) {
  return Container(
    height: 1,
    color: Theme.of(context).secondaryHeaderColor,
  );
}

Widget menuTile(BuildContext context, name) {
  return Text(
    name,
    style: Theme.of(context).textTheme.headline4,
  );
}
