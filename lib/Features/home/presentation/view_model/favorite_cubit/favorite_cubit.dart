import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eqraa/Features/home/data/models/book_model/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavoritesCubit extends Cubit<List<BookModel>> {
  FavoritesCubit() : super([]);

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString('favorites');

    if (favoritesJson != null) {
      List<dynamic> favoritesList = json.decode(favoritesJson);
      List<BookModel> favorites =
      favoritesList.map((book) => BookModel.fromJson(book)).toList();
      emit(favorites);
    } else {
      emit([]);
    }
  }

  Future<void> toggleFavorite(BookModel book) async {
    final currentFavorites = List<BookModel>.from(state);

    if (currentFavorites.any((favBook) => favBook.id == book.id)) {
      currentFavorites.removeWhere((favBook) => favBook.id == book.id);
    } else {
      currentFavorites.add(book);
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorites',
        json.encode(currentFavorites.map((b) => b.toJson()).toList()));
    emit(currentFavorites);
  }

  Future<void> removeFromFavorites(BookModel book) async {
    final currentFavorites = List<BookModel>.from(state);
    currentFavorites.removeWhere((favBook) => favBook.id == book.id);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorites',
        json.encode(currentFavorites.map((b) => b.toJson()).toList()));
    emit(currentFavorites);
  }
}
