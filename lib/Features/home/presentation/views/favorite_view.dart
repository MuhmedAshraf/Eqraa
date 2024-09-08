import 'package:eqraa/Features/home/data/models/book_model/book_model.dart';
import 'package:eqraa/Features/home/presentation/views/book_details_view.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utlis/colors.dart';
import '../../../../Core/utlis/styles.dart';
import '../view_model/favorite_cubit/favorite_cubit.dart';

class BookFavoriteView extends StatelessWidget {
  const BookFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        elevation: 0,
        title: const Text(
          'Favorite',
          style: AppStyles.title18,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.favorite,
      ),
      body: const FavoriteListView(),
    );
  }
}

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, List<BookModel>>(
        builder: (context, favorites) {
      if (favorites.isEmpty) {
        return const Center(child: Text("No favorite books added yet."));
      } else {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: favorites.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final book = favorites[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BookDetailsView(book: book)));
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      // إضافة مسافة داخلية
                      title: Row(
                        children: [
                          // صورة الكتاب
                          book.thumbnail != null
                              ? Container(
                                  width: 80, // عرض الصورة
                                  height: 120, // ارتفاع الصورة
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(book.thumbnail!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  width: 80,
                                  height: 120,
                                ), // مساحة فارغة إذا لم توجد صورة
                          const SizedBox(
                            width: 10,
                          ), // مسافة بين الصورة والعنوان
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  book.authors ?? 'Unknown Author',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          // أيقونة القلب
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              context
                                  .read<FavoritesCubit>()
                                  .toggleFavorite(book);
                              context
                                  .read<FavoritesCubit>()
                                  .removeFromFavorites(book);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Divider(
                      color: AppColors.appBar,
                      thickness: 1.5,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }
    });
  }
}
