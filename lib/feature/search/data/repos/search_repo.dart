import 'package:bookly_app/core/errors/failuer.dart';
import 'package:dartz/dartz.dart';

import '../../../home/data/models/book_model.dart';


abstract class  SearchRepo{

  Future<Either<Failures,List<BookModel>>> fetchSearchBooks({required String name});
}