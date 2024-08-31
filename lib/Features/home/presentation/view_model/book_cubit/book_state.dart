part of 'book_cubit.dart';

@immutable
sealed class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookSuccess extends BookState {

  final List<BookModel> books ;

  BookSuccess({required this.books});
}

class BookFailure extends BookState {
  final String errMessage;

  BookFailure({required this.errMessage});
}
