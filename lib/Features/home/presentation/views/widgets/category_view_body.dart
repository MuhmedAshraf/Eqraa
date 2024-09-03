import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/shared_widgets/custom_error_widget.dart';
import '../../../../../Core/shared_widgets/custom_loading.dart';
import '../../view_model/book_cubit/book_cubit.dart';
import 'custom_book_item.dart';

class BookCategoryBody extends StatelessWidget {
  const BookCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        if (state is BookSuccess) {
          return ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) =>
                  CustomBookItem(book: state.books[i]));
        }
        else if (state is BookFailure) {
          return CustomErrorWidget(errorText: state.errMessage);
        }
        else {
          return const CustomLoading();
        }
      },
    );
  }
}
