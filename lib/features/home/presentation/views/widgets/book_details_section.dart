import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_item.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .16),
          child: const CustomBookImage(
            imageUrl:
                'https://images.pexels.com/photos/27202978/pexels-photo-27202978/free-photo-of-the-night-sky-over-a-lake-with-stars-and-a-blue-sky.jpeg',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          'The jungle book',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            'jungle book',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
