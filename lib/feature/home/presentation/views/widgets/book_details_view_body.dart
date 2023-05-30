import 'package:bookly_app/feature/home/data/models/book_model.dart';
import 'package:bookly_app/feature/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'books_details_section.dart';


class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
   return CustomScrollView(
     slivers: [
       SliverFillRemaining(
         hasScrollBody: false,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children:  [
                BookDetailsSection(bookModel: bookModel),
               const  Expanded(
                 child:  SizedBox(
                   height: 50,
                 ),
               ),
                const SimilarBooksSection(),
                const SizedBox(
                 height: 40,
               ),
             ],
           ),
         ),
       )
     ],
   );
  }
}


