import 'package:booklyapp/core/widgets/custom_error_message.dart';
import 'package:booklyapp/core/widgets/custom_indicator.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_best_seller_list_view_item.dart';
import 'package:booklyapp/features/home/presentation/views_model/managers/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBestSellerListView extends StatelessWidget {
  const CustomBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.newestBooks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(vertical: 10),
                  child: CustomBestSellerListViewItem(bookModel: state.newestBooks[index],),
                );
              });
        } else if (state is NewestBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const CustomIndicator();
        }
      },
    );
  }
}
