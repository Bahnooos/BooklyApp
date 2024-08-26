part of 'featured_cubit.dart';

sealed class FeaturedState extends Equatable {
  const FeaturedState();

  @override
  List<Object> get props => [];
}

final class FeaturedInitial extends FeaturedState {}
final class FeaturedLoading extends FeaturedState {}
final class FeaturedSuccess extends FeaturedState {
 final List<BookModel> books;

 const FeaturedSuccess({required this.books});
}
final class FeaturedFailure extends FeaturedState {
  final String errMessage;

 const FeaturedFailure({required this.errMessage});
}
