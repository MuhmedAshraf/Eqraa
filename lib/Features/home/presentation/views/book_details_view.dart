import 'package:cached_network_image/cached_network_image.dart';
import 'package:eqraa/Core/utlis/colors.dart';
import 'package:eqraa/Core/utlis/styles.dart';
import 'package:eqraa/Features/home/data/models/book_model/book_model.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: AppStyles.title18,
        title: Text(
          book.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.bgColor,
      body: BookDetailsBody(
        book: book,
      ),
    );
  }
}

