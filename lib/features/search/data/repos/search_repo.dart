import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<BookModel>>> fetechSearchedBooks({required String text});
  Future<Either<Failure,List<BookModel>>> searchedInBooks({required dynamic text});
}