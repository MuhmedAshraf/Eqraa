import 'dart:async';

import 'package:eqraa/Core/errors/failure.dart';
import 'package:eqraa/Features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

  Future<Either<Failure,List<BookModel>>> getNewestBooks();
}