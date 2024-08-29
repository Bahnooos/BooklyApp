import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

import 'custom_search_list_view.dart';
import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomTextField(),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Best Seller',
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 16,
          ),
           Expanded(child: CustomSearchListView(bookModel:bookModel ,)),
        ],
      ),
    );
  }
}
