import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/feature/home/data/models/book_model.dart';
import 'package:bookly_app/feature/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/feature/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../feature/home/data/repos/home_repo_impl.dart';
import '../../feature/home/presentation/cubit/similar_books_cubit/similar_books_cubit.dart';
import '../../feature/search/data/repos/search_repo_impl.dart';
import '../../feature/search/presentation/cubit/search_cubit/search_cubit.dart';
import '../../feature/search/presentation/views/search_view.dart';
import '../../feature/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),

      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(bookModel: state.extra as BookModel,),
            ),
      ),

      GoRoute(
        path: kSearchView,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
              child: const SearchView(),
            ),
      ),
    ],
  );
}