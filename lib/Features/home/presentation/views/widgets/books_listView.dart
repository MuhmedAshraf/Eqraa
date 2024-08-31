import 'package:eqraa/Core/shared_widgets/custom_error_widget.dart';
import 'package:eqraa/Core/shared_widgets/custom_loading.dart';
import 'package:eqraa/Features/home/presentation/view_model/book_cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        if(state is BookSuccess){
          return ListView.builder(
            itemBuilder: (context, i) =>  CustomBookItem(book: state.books[i],),
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
          );
        }
        else if(state is BookFailure){
          return CustomErrorWidget(errorText: state.errMessage);
        }
        else {
          return const CustomLoading();
        }
      },
    );
  }
}
