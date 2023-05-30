import 'package:bookly_app/core/errors/failuer.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/feature/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../home/data/models/book_model.dart';


class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchBooks
      ({required String name})async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$name');
      // BookModel bookModel=BookModel.fromJson(data!['items']);
      List<BookModel> books=[];
      for(var item in data!['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }  catch (e) {
      if(e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
