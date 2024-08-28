import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'book_details_section.dart';

import 'similar_books_sections.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding:const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  BooksDetailsSection(bookModel:bookModel ,),
                const  SizedBox(
                    height: 30,
                  ),
                  BookActions( bookModel: bookModel,),
                const  Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SimilarBooksSections(bookModel: bookModel,),
                 const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
