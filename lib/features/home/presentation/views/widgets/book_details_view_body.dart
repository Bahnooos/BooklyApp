import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'book_details_section.dart';

import 'similar_books_sections.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  BooksDetailsSection(),
                  SizedBox(
                    height: 30,
                  ),
                  BookActions(),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SimilarBooksSections(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
