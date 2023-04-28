import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/home/data/models/home_data_models/home_data_response.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeDataResponse>> getHomeData();
}
