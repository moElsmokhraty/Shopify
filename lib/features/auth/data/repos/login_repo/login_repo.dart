import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/models/user_data_models/user_data_response.dart';
import 'package:store_app/features/auth/data/models/login_models/login_request.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserDataResponse>> login(LoginRequest request);
}
