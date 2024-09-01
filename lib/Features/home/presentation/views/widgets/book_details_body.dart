import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utlis/styles.dart';
import '../../../data/models/book_model/book_model.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: book.thumbnail ?? '',
                width: size.width * 0.5,
                height: size.height * 0.3,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(child: Text(book.title,style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.bold),)),
            const SizedBox(
              height: 10,
            ),
            Text('Authors : ${book.authors ?? 'No authors available'}',style: AppStyles.textStyle20,),
            const SizedBox(
              height: 15,
            ),
            Text('Category : ${book.category ?? 'un defined '}',style: AppStyles.textStyle20,),
            const SizedBox(
              height: 15,
            ),
            Text('Description : ${book.description}',style: AppStyles.textStyle14,),
          ],
        ),
      ),
    );
  }
}
