import 'package:booklyapp/features/search/presentation/view_model/managers/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import 'build_search_books.dart';

class BuildFloatingSearchBar extends StatelessWidget {
   BuildFloatingSearchBar({super.key});
 
  final FloatingSearchBarController searchBarController =
      FloatingSearchBarController();
  @override
  Widget build(BuildContext context) {
    
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: searchBarController,
      hint: 'find your Book',
      hintStyle: const TextStyle(fontSize: 16, color: Colors.blueAccent),
      queryStyle: const TextStyle(fontSize: 16, color: Colors.blueAccent),
      border: const BorderSide(style: BorderStyle.none),
      elevation: 6,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      axisAlignment: isPortrait ? 0.0 : 1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        getSearchBooks(query, context);
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildSearchedBooks(),
            ],
          ),
        );
      },
    );
  }
   getSearchBooks(query, BuildContext context) {
    BlocProvider.of<SearchCubit>(context)
        .emitbooksSuggestion(suggestion: query);
  }

  }
