import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) => const CustomBookItem(),
      physics: const BouncingScrollPhysics(),
      itemCount: 15,
    );
  }
}
