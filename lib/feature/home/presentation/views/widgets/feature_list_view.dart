import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../cubit/feature_books_cubit/feature_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if(state is FeatureBooksSuccess){
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .24,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 9.0),
                    child: GestureDetector(
                      onTap:() {
                        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo?.imageLinks?.thumbnail??"",
                      ),
                    ),
                  );
                },),
            ),
          );
        }else if(state is FeatureBooksError){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
/*
return ConditionalBuilder(
          condition: state is FeatureBooksSuccess,
          builder: (context) => SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .24,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 0,),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 9.0),
                    child: CustomBookItem(),
                  );
                },),
            ),
          ),
          fallback:(context) {
           if(state is FeatureBooksError) {
             return CustomErrorWidget(errorMessage: state.errorMessage);
           }else{
             return const CustomLoadingIndicator();
           }
          } ,

        );
 */