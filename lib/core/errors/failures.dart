import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errMessage: 'Connection Timeout with Server , please try again');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errMessage: 'Send Timeout with Server , please try again');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errMessage: 'Recieve Timeout with Server , please try again');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errMessage: 'Wrong Informaton with Server , please try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromRespons(
            statuesCode: dioException.response!.statusCode!,
            response: dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: 'your Reqest was canceled, please try again');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errMessage: 'No Internet connection , please try again');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'UnEcepted Error , Please try again');
    }
  }

  factory ServerFailure.fromRespons(
      {required int statuesCode, required dynamic response}) {
    if (statuesCode == 400 || statuesCode == 401 || statuesCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statuesCode == 404) {
      return ServerFailure(
          errMessage: 'Your request not found, Please try letter!');
    } else if (statuesCode == 500) {
      return ServerFailure(
          errMessage: 'Internal server error, Please try letter!');
    }
    return ServerFailure(
        errMessage: 'OPPs There was an Error , Please try again');
  }
}
