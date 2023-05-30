import 'package:bookly_app/core/errors/failuer.dart';
import 'package:dartz/dartz.dart';

import '../models/book_model.dart';

abstract class  HomeRepo{

  Future<Either<Failures,List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failures,List<BookModel>>> fetchFeatureBooks();
  Future<Either<Failures,List<BookModel>>> fetchSimilarBooks({required String category});
}