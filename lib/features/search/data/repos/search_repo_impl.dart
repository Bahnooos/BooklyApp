import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> fetechSearchedBooks(
      {required String text}) async {
    try {
      var data = await apiServices.get(
          endPoints: 'volumes?Filtering=free-ebooks&q=Programming');
      List<BookModel> searchedBooks = [];
      for (var item in data['items']) {
        searchedBooks.add(BookModel.fromJson(item));
      }
      return right(searchedBooks);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> searchedInBooks(
      {required dynamic text}) async {
    try {
      var data = await apiServices.get(
          endPoints: 'volumes?Filtering=free-ebooks&q=$text+intitle');

      List<BookModel> suggestion = [];
      for (var item in data['items']) {
        suggestion.add(BookModel.fromJson(item));
      }
      
      return right(suggestion);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
