import 'package:flutter/material.dart';
import 'custom_category_box.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Center(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(''), accountEmail: Text('')),
            CatBox(category: "Fiction"),
            CatBox(category: "Science"),
            CatBox(category: "History"),
            CatBox(category: "Biography"),
            CatBox(category: "Technology"),
          ],
        ),
      ),
    );
  }
}
