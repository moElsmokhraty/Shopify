import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/models/user_data_models/user_data_response.dart';
import 'package:store_app/features/settings/data/models/log_out_models/log_out_response.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserDataResponse>> getProfile();

  Future<Either<Failure, LogOutResponse>> logout();
}
