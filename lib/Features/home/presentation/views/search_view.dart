import 'package:eqraa/Features/home/presentation/view_model/book_cubit/book_cubit.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBox(controller: controller),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                if (state is BookSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) =>
                          CustomBookItem(book: state.books[i]),
                      itemCount: state.books.length,
                      physics: const BouncingScrollPhysics(),
                    ),
                  );
                } else if (state is BookFailure) {
                  return Center(child: Text(state.errMessage));
                } else if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const SizedBox();
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
