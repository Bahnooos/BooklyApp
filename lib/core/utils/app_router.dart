import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';

import 'package:booklyapp/features/home/data/repos/home_repo_implement.dart';
import 'package:booklyapp/features/home/presentation/views/book_details_view.dart';
import 'package:booklyapp/features/home/presentation/views/home_view.dart';
import 'package:booklyapp/features/home/presentation/views_model/managers/similar_books_cubit/similar_books_cubit.dart';
import 'package:booklyapp/features/search/presentation/views/search_view.dart';
import 'package:booklyapp/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: bookDetailsView,
        builder: ( context,  state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(bookModel: state.extra as BookModel,),
          );
        },
      ),
      GoRoute(
        path: searchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );
}
