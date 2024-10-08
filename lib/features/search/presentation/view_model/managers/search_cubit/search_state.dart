part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchLoadingBooks extends SearchState {
  final List<BookModel> suggestionBooks;

 const SearchLoadingBooks({required this.suggestionBooks});
}
final class SearchSuccess extends SearchState {
  final List<BookModel> searchedBooks;

 const SearchSuccess({required this.searchedBooks});
}
final class SearchFailure extends SearchState {
  final String errMessage;

 const SearchFailure({required this.errMessage});
}
