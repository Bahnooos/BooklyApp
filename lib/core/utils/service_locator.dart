import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/features/home/data/repos/home_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiServices: getIt.get<ApiServices>()));
}
