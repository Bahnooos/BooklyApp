import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/book_model/book_model.dart';
import '../../../../home/presentation/views/widgets/custom_book_item.dart';

class CustomSearchedListViewItem extends StatelessWidget {
  const CustomSearchedListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,
      child: Row(

        children: [
          SizedBox(height:125,child:  CustomBookImage(imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '' )),
        const  SizedBox(width: 16,),
         SizedBox(
          width: MediaQuery.of(context).size.width*.5,
           child: Center(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bookModel.volumeInfo?.title ,style: Styles.textStyle20,overflow: TextOverflow.ellipsis,maxLines: 2, ),
                Text(bookModel.volumeInfo?.authors?[0] ?? 'author not known' ,style: Styles.textStyle16,overflow: TextOverflow.ellipsis,maxLines: 1, ),
              ],
             ),
           ),
         )
        ],
      ),
    );
  }
}