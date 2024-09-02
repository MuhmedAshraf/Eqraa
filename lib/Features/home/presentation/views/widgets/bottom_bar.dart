import 'package:eqraa/Core/utlis/colors.dart';
import 'package:eqraa/Core/utlis/styles.dart';
import 'package:eqraa/Features/home/data/models/book_model/book_model.dart';
import 'package:eqraa/Features/home/presentation/views/favorite_view.dart';
import 'package:eqraa/Features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuState { home, favorite, search }

class CustomBottomNavBar extends StatelessWidget {
  final MenuState? selectedMenu;
  final List<BookModel>? allBooks;
  final List<BookModel>? favBooks;

  const CustomBottomNavBar({
    super.key,
    this.selectedMenu,
    this.allBooks,
    this.favBooks,
  });

  @override
  Widget build(BuildContext context) {
    const Color inactiveIconColor = Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.appBar,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home,
                    size: 16,
                  ),
                  color: MenuState.home == selectedMenu
                      ? AppColors.selectedIcon
                      : inactiveIconColor,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomeView()),
                    );
                  },
                ),
                Text(
                  'Home',
                  style: AppStyles.textStyle14.copyWith(color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    size: 16,
                  ),
                  color: MenuState.favorite == selectedMenu
                      ? AppColors.selectedIcon
                      : inactiveIconColor,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const BookFavoriteView();
                          // return BlocProvider(
                          //   create: (context) =>
                          //       FavoritesCubit()..loadFavorites(),
                          //   child: FavoritesScreen(), // استخدام favBooks هنا
                          // );
                        },
                      ),
                    );
                  },
                ),
                Text(
                  'Favorite',
                  style: AppStyles.textStyle14.copyWith(color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 16,
                  ),
                  color: MenuState.search == selectedMenu
                      ? AppColors.selectedIcon
                      : inactiveIconColor,
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => BooksSearchView(),
                    //   ),
                    // );
                  },
                ),
                Text(
                  'Search',
                  style: AppStyles.textStyle14.copyWith(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
