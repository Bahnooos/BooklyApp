import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_best_seller_list_view.dart';

import 'custom_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding:const EdgeInsets.only(left: 30),
                child: CustomAppBar(bookModel: bookModel,),
              ),
              const CustomListView(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Seller',
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomBestSellerListView(),
          ),
        ),
      ],
    );
  }
}
