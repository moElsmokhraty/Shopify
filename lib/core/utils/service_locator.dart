import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:store_app/features/auth/data/repos/register_repo/register_repo_impl.dart';
import 'package:store_app/features/home/data/repos/details_repo/details_repo_impl.dart';
import 'package:store_app/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:store_app/features/settings/data/repos/settings_repo/settings_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
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

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SettingsRepoImpl>(
    SettingsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
