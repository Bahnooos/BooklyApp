import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/widgets/custom_error_message.dart';
import 'package:booklyapp/core/widgets/custom_indicator.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/search/presentation/view_model/managers/search_cubit/search_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_search_list_view_item.dart';

class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.searchedBooks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // child: CustomBestSellerListViewItem(),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(bookDetailsView,
                          extra: state.searchedBooks[index]);
                    },
                    child: CustomSearchedListViewItem(
                      bookModel: state.searchedBooks[index],
                    ),
                  ),   
                );
              });
        } else if (state is SearchFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        }
        return const CustomIndicator();
      },
    );
  }
}
