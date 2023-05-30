
import 'package:bookly_app/feature/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/book_model.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  static SearchCubit? get(context) => BlocProvider.of(context);

  SearchRepo searchRepo;

  Future<void> fetchSearchBooks({
  required String name
})async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(name: name);
    result.fold((failure) {
      emit(SearchError(failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }


}
