import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/models/user_data_model/user_data_response.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/settings/data/models/log_out_response.dart';
import 'package:store_app/features/settings/data/repos/settings_repo/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  final ApiService _apiService;

  SettingsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UserDataResponse>> getProfile() async {
    // TODO: implement getProfile
    try {
      var data =
          await _apiService.get(endpoint: kProfileEndpoint, token: token);
      return Right(UserDataResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LogOutResponse>> logout() async {
    try {
      var data = await _apiService.post(
        endpoint: kLogoutEndpoint,
        data: {
          "fcm_token": "SomeFcmToken",
        },
        token: token,
      );
      return Right(LogOutResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
