
import 'package:bookly_app/feature/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model.dart';


part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());

  static FeatureBooksCubit? get(context) => BlocProvider.of(context);

  HomeRepo homeRepo;

  Future<void> fetchFeatureBooks()async {
    emit(FeatureBooksLoading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold((failure) {
      emit(FeatureBooksError(failure.errorMessage));
    }, (books) {
      emit(FeatureBooksSuccess(books));
    });
  }
}
