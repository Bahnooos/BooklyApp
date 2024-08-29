import 'package:booklyapp/constants.dart';

import 'package:booklyapp/core/widgets/custom_error_message.dart';
import 'package:booklyapp/core/widgets/custom_indicator.dart';
import 'package:booklyapp/features/home/presentation/views_model/managers/featured_cubit/featured_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeaturedState>(
      builder: (context, state) {
        if (state is FeaturedSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(bookDetailsView, extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo!.imageLinks!.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const CustomIndicator();
        }
      },
    );
  }
}
