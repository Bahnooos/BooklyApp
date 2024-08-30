import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_indicator.dart';
import '../../view_model/managers/search_cubit/search_cubit.dart';
import 'custom_search_list_view_item.dart';

class BuildSearchedBooks extends StatelessWidget {
  const BuildSearchedBooks({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingBooks) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.suggestionBooks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final book=state.suggestionBooks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // child: CustomBestSellerListViewItem(),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(bookDetailsView,
                          extra: state.suggestionBooks[index]);
                    },
                    child: CustomSearchedListViewItem(
                      imageurl: book.volumeInfo?.imageLinks?.thumbnail,
                      title: book.volumeInfo?.title,
                      author: book.volumeInfo?.authors?[0],
                      
                      bookModel: state.suggestionBooks[index] ,
                    ),
                  ),   
                );
              });
        } else if (state is SearchFailure) {
          return  Container();
        }
        return const CustomIndicator();
      },
    );
  }
}
