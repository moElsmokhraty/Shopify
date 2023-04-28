import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/models/user_data_models/user_data_response.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/auth/data/models/register_models/register_request.dart';
import 'package:store_app/features/auth/data/repos/register_repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService _apiService;

  RegisterRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UserDataResponse>> register(
      RegisterRequest request) async {
    try {
      var data = await _apiService.post(
          endpoint: kRegisterEndpoint, data: request.toJson());
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
