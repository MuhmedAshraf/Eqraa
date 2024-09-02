import 'package:cached_network_image/cached_network_image.dart';
import 'package:eqraa/Core/shared_widgets/main_button.dart';
import 'package:eqraa/Features/home/presentation/views/book_reder_view.dart';
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
        padding: const EdgeInsets.all(15),
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
            //! Title
            Center(
                child: Text(
              book.title,
              style:
                  AppStyles.textStyle24.copyWith(fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 10,
            ),
            //! Authors
            Center(
                child: Text(
              'By ${book.authors ?? 'No authors available'}',
              style: AppStyles.textStyle20,
            )),
            const SizedBox(
              height: 10,
            ),
            //! Category
            Text(
              'Category : ${book.category ?? 'un defined '}',
              style: AppStyles.textStyle20,
            ),
            const SizedBox(
              height: 10,
            ),
            //! Description
            Text(
              'Description : ${book.description}',
              style: AppStyles.textStyle16,
            ),
            const SizedBox(
              height: 20,
            ),
            //! Main Button
            Center(
              child: MainButton(
                  innerText: 'Read Book',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookReaderScreen(bookUrl: book.url),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
