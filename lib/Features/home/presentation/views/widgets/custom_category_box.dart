import 'package:flutter/material.dart';
import '../../../../../Core/utlis/styles.dart';
import '../book_category_view.dart';

class CatBox extends StatelessWidget {
  const CatBox({super.key, required this.category});

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
              style: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
