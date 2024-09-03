import 'package:eqraa/Core/utlis/styles.dart';
import 'package:eqraa/Features/home/presentation/views/book_category_view.dart';
import 'package:flutter/material.dart';

import 'custom_category_box.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('mohamed@gmail.com'),
            accountName: Text('Mohamed Ashraf'),
          ),
          CatBox(category: "Fiction"),
          CatBox(category: "Science"),
          CatBox(category: "History"),
          CatBox(category: "Biography"),
          CatBox(category: "Technology"),
        ],
      ),
    );
  }
}

