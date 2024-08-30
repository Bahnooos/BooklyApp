import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';




import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
       padding: EdgeInsets.symmetric(vertical: 8),
       child: CustomTextField(),
                ),
    ) ,)
      ],
    );
    
}
}