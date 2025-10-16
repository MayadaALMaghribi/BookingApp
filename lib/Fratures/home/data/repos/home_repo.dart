import 'package:bookely/Fratures/home/data/models/book_model/book_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBook();
  Future<Either<Failure, List<BookModel>>> fetchFeautredBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
