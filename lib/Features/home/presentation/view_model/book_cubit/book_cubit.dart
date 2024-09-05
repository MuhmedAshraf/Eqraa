import 'package:bloc/bloc.dart';
import 'package:eqraa/Features/home/data/repo/book_repo/book_rebo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit({required this.repo}) : super(BookInitial());

  final HomeRepo repo;

  Future<void> getNewestBooks() async {
    emit(BookLoading());
    final response = await repo.getNewestBooks();
    response.fold(
      (failure) => emit(BookFailure(errMessage: failure.errMessage)),
      (books) => emit(BookSuccess(books: books)),
    );
  }

  Future<void> getBooksByCategory(String category) async {
    emit(BookLoading());
    final response = await repo.getBooksByCategory(category);
    response.fold(
      (failure) => emit(BookFailure(errMessage: failure.errMessage)),
      (books) => emit(BookSuccess(books: books)),
    );
  }

  Future<void> searchBooks(String query) async {
    emit(BookLoading());
    final response = await repo.searchBooks(query);
    response.fold(
      (failure) => emit(BookFailure(errMessage: failure.errMessage)),
      (books) => emit(BookSuccess(books: books)),
    );
  }
}
