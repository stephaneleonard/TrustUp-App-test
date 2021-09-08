import 'package:flutter/material.dart';
import 'package:mytrustup/widgets/logo.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Logo()),
          ListTile(
            title: const Text('Account'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
