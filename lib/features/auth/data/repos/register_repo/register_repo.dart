import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/models/user_data_model/user_data_response.dart';
import 'package:store_app/features/auth/data/models/register_request.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserDataResponse>> register(RegisterRequest request);
}
