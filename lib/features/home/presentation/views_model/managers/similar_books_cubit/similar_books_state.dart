part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> similarBooks;

 const SimilarBooksSuccess({required this.similarBooks});
}
final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

 const SimilarBooksFailure({required this.errMessage});
}
final class SimilarBooksLoading extends SimilarBooksState {}
