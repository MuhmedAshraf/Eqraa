import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eqraa/Core/api_helper/api_consumer.dart';
import 'package:eqraa/Core/api_helper/end_points.dart';
import 'package:eqraa/Core/errors/failure.dart';
import 'package:eqraa/Features/home/data/models/book_model/book_model.dart';
import 'package:eqraa/Features/home/data/repo/book_repo/book_rebo.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImplement({required this.api});

  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks() async {
    return await _fetchBooks(endPoint: EndPoints.newestBooks);
  }

  @override
  Future<Either<Failure, List<BookModel>>> getBooksByCategory(
      String category) async {
    return await _fetchBooks(
        endPoint: '${EndPoints.categoryBooks}q=subject:$category');
  }

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(String query) async {
    return await _fetchBooks(endPoint: '${EndPoints.searchBooks}$query');
  }

  Future<Either<Failure, List<BookModel>>> _fetchBooks(
      {required String endPoint}) async {
    try {
      final response = await api.get(endPoint);
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
