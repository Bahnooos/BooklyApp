import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: CustomBookImage(
              imageUrl:
                  'https://images.pexels.com/photos/27202978/pexels-photo-27202978/free-photo-of-the-night-sky-over-a-lake-with-stars-and-a-blue-sky.jpeg',
            ),
          );
        },
      ),
    );
  }
}
