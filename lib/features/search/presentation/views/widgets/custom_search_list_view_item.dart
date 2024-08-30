import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/book_model/book_model.dart';
import '../../../../home/presentation/views/widgets/custom_book_item.dart';

class CustomSearchedListViewItem extends StatelessWidget {
  const CustomSearchedListViewItem({super.key, required this.bookModel, this.imageurl, this.title, this.author});
  final BookModel bookModel;
  final String? imageurl;
  final String? title;
  final String? author;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      
      child: Row(

        children: [
          SizedBox(height:125,child:  CustomBookImage(imageUrl: imageurl ??'')),
        const  SizedBox(width: 16,),
         SizedBox(
          width: MediaQuery.of(context).size.width*.5,
           child: Center(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title??'' ,style: Styles.textStyle20,overflow: TextOverflow.ellipsis,maxLines: 2, ),
               const SizedBox(height: 5,),
                Text(author??'' ,style: Styles.textStyle16,overflow: TextOverflow.ellipsis,maxLines: 1, ),
              ],
             ),
           ),
         )
        ],
      ),
    );
  }
}