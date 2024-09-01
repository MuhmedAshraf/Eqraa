import 'package:eqraa/Features/home/data/models/book_model/book_model.dart';
import 'package:eqraa/Features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utlis/styles.dart';
import 'custom_book_image.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return GestureDetector(

      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  BookDetailsView(book: book,)));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: 130,
            child: Row(
              children: [
                CustomBookImage(
                  imageUrl: book.thumbnail ?? "",
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        book.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppStyles.textStyle20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width:size.width * 0.5 ,
                      child: Text(
                        book.authors ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle14,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
