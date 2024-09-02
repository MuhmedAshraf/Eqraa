import 'package:eqraa/Core/utlis/styles.dart';
import 'package:eqraa/Features/home/presentation/views/book_category_view.dart';
import 'package:flutter/material.dart';

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

class CatBox extends StatelessWidget {
  const CatBox({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookCategoryView(category: category)),
            );
          },
          child: ListTile(
            title: Text(
              category,
              style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
