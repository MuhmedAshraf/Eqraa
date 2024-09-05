import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:eqraa/Core/api_helper/dio_consumer.dart';
import 'package:eqraa/Core/shared_widgets/custom_error_widget.dart';
import 'package:eqraa/Core/shared_widgets/custom_loading.dart';
import 'package:eqraa/Features/home/data/repo/book_repo/home_repo_implement.dart';
import 'package:eqraa/Features/home/presentation/view_model/book_cubit/book_cubit.dart';
import 'package:eqraa/Features/home/presentation/views/book_details_view.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/bottom_bar.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utlis/colors.dart';
import '../../../../Core/utlis/styles.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: const Text(
          'Search',
          style: AppStyles.title18,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBox(controller: controller),
            InkWell(
              onTap: () {
                final query = controller.text;
                if (query.isNotEmpty) {
                  context.read<BookCubit>().searchBooks(query);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 236, 235, 235),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Center(child: Text('Click to Search')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                else if (state is BookSuccess) {
                  return Column(
                    children: state.books.map((book) {
                      return ListTile(
                        title: Text(book.title),
                        subtitle: Text(book.authors ?? 'No authors available'),
                        leading: book.thumbnail != null
                            ? Image.network(book.thumbnail!)
                            : null,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookDetailsView(book: book),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                }
                else if (state is BookFailure) {
                  return Center(child: Text(state.errMessage));
                }
                else{
                  return const Center(child: Text('No matching books'));
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.search,
      ),
    );
  }
}


