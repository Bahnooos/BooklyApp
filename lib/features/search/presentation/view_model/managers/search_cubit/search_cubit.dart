
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/features/search/data/repos/search_repo_impl.dart';
import 'package:equatable/equatable.dart';

import '../../../../../home/data/models/book_model/book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImpl) : super(SearchInitial());
 final SearchRepoImpl searchRepoImpl;
 Future<void>  fetechSearchedBooks({required String text})async{
  emit(SearchLoading());
  var result=await searchRepoImpl.fetechSearchedBooks(text: text);
  result.fold((failure){
   emit(SearchFailure(errMessage: failure.errMessage));
  }, (books){
    emit(SearchSuccess(searchedBooks: books));
  });
 
 }

  Future<void> emitbooksSuggestion({required String suggestion})async{
    emit(SearchLoading());
      var result= await searchRepoImpl.searchedInBooks(text: suggestion);
      result.fold((failure){
        emit(SearchFailure(errMessage: failure.errMessage));
      }, (books){
        emit(SearchLoadingBooks(suggestionBooks: books));
      });
 }
}
