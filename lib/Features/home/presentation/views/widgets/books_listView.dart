import 'package:dio/dio.dart';
import 'package:eqraa/Core/api_helper/dio_consumer.dart';
import 'package:eqraa/Core/shared_widgets/custom_error_widget.dart';
import 'package:eqraa/Core/shared_widgets/custom_loading.dart';
import 'package:eqraa/Features/home/data/repo/book_repo/home_repo_implement.dart';
import 'package:eqraa/Features/home/presentation/view_model/book_cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit(repo: HomeRepoImplement(api: DioConsumer(dio: Dio())))..getNewestBooks(),
      child: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if (state is BookSuccess) {
            return ListView.builder(
              itemBuilder: (context, i) =>
                  CustomBookItem(book: state.books[i],),
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
            );
          }
          else if (state is BookFailure) {
            return CustomErrorWidget(errorText: state.errMessage);
          }
          else {
            return const CustomLoading();
          }
        },
      ),
    );
  }
}
