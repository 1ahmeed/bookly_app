import 'package:bookly_app/feature/home/data/models/book_model.dart';
import 'package:bookly_app/feature/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

import '../cubit/similar_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends  StatefulWidget {
  const BookDetailsView({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
 SimilarBooksCubit.get(context)?.fetchSimilarBooks(
   category: widget.bookModel.volumeInfo!.categories![0]
 );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
