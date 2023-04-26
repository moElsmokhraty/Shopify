import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';

import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/home/data/models/favourite_models/add_or_remove_favourite_models/add_or_remove_favourite_response.dart';
import 'package:store_app/features/home/data/models/favourite_models/get_favourite_models/get_favourite_response.dart';


import 'favourite_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final ApiService _apiService;

  FavouriteRepoImpl(this._apiService);
  @override
  Future<Either<Failure, AddOrRemoveFavouriteResponse>> addOrRemoveFavourite(
      int productId) async {
    try {
      var response = await _apiService.post(
        endpoint: kFavouritesEndpoint,
        token: token,
        data: {"product_id": productId},
      );
      return Right(AddOrRemoveFavouriteResponse.fromJson(response));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetFavouriteResponse>> fetchFavourites() async {
    try {
      var response =
          await _apiService.get(endpoint: kFavouritesEndpoint, token: token);
      return Right(GetFavouriteResponse.fromJson(response));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }



}
