import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';

import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/utils/api_service.dart';

import 'package:store_app/features/home/data/models/favourite_models/favourite_response/favourite_response.dart';

import 'favourite_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final ApiService _apiService;

  FavouriteRepoImpl(this._apiService);

  @override
  Future<Either<Failure, FavouriteResponse>> getFavourites() async {
    try {
      var response =
          await _apiService.get(endpoint: kFavouritesEndpoint, token: token);
      return Right(FavouriteResponse.fromJson(response));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
