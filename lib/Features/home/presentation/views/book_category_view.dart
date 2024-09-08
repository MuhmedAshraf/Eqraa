import 'package:dio/dio.dart';
import 'package:eqraa/Core/api_helper/dio_consumer.dart';
import 'package:eqraa/Features/home/data/repo/book_repo/home_repo_implement.dart';
import 'package:eqraa/Features/home/presentation/view_model/book_cubit/book_cubit.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/bottom_bar.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/category_view_body.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utlis/colors.dart';
import '../../../../Core/utlis/styles.dart';

class BookCategoryView extends StatelessWidget {
  const BookCategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookCubit(repo: HomeRepoImplement(api: DioConsumer(dio: Dio())))
            ..getBooksByCategory(category),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBar,
          title: Text(
            'books in $category',
            style: AppStyles.title18,
          ),
          centerTitle: true,
          // automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const CustomDrawer(),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: BookCategoryBody(),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
