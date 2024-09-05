import 'package:flutter/material.dart';

import 'books_listView.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child: BooksListView(),
    );
  }
}
