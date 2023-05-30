part of 'feature_books_cubit.dart';

@immutable
abstract class FeatureBooksState {}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}
class FeatureBooksSuccess extends FeatureBooksState {
  final List<BookModel> books;

  FeatureBooksSuccess(this.books);
}
class FeatureBooksError extends FeatureBooksState {
  final String errorMessage;

  FeatureBooksError(this.errorMessage);
}
