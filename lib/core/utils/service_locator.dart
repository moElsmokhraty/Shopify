import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:store_app/features/auth/data/repos/register_repo/register_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            'lang': 'en',
          },
        ),
      ),
    ),
  );

  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<RegisterRepoImpl>(
    RegisterRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
