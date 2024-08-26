import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  FeaturedCubit({required this.homeRepo}) : super(FeaturedInitial());
  HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(FeaturedSuccess(books: books));
    });
  }
}
