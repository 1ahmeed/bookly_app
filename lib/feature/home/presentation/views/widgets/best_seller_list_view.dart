import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if(state is NewestBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              // shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: BookListViewItem(bookModel:state.books[index],
                    ),
                  ));
        }else if(state is NewestBooksError){
          return CustomErrorWidget(errorMessage:state.errorMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
