import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/models/user_data_model/user_data_response.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/auth/data/models/login_request.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService _apiService;

  LoginRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UserDataResponse>> login(LoginRequest request) async {
    try {
      var data = await _apiService.post(
          endpoint: kLoginEndpoint, data: request.toJson());
      return Right(UserDataResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
