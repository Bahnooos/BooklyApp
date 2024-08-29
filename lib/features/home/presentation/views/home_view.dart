import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(body: HomeViewBody(bookModel: bookModel,));
  }
}
