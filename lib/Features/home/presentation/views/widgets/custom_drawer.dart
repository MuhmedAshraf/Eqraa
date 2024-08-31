import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(

      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('mmmmmmmmmm'),
            accountName: Text('kkkkkkkkkkk'),
          ),
          ListTile(
            title: Text('fiction'),
          ),
          Divider(),
          ListTile(
            title: Text('fiction'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
