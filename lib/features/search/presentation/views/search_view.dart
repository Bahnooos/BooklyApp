import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/search/presentation/view_model/managers/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key,required  this.bookModel});
  final BookModel bookModel;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
  BlocProvider.of<SearchCubit>(context).fetechSearchedBooks(text:widget.bookModel.volumeInfo?.title??'' );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: SearchViewBody(bookModel: widget.bookModel,)),
    );
  }
}
