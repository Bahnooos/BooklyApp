import 'package:booklyapp/core/widgets/custom_error_message.dart';
import 'package:booklyapp/core/widgets/custom_indicator.dart';
import 'package:booklyapp/features/home/presentation/views_model/managers/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            return ListView.builder(
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
            );
          } else if(state is SimilarBooksFailure){
            return  CustomErrorMessage(errMessage: state.errMessage);
          } else{
            return const CustomIndicator();
          }
        },
      ),
    );
  }
}
