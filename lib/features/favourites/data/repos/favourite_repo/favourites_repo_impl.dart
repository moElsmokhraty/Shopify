import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/favourites/data/models/add_or_remove_favourite_models/add_or_remove_favourite_response.dart';
import 'package:store_app/features/favourites/data/models/get_favourites_models/get_favourites_response.dart';
import 'favourites_repo.dart';

class FavouritesRepoImpl implements FavouritesRepo {
  final ApiService _apiService;

  FavouritesRepoImpl(this._apiService);

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
  Future<Either<Failure, GetFavouritesResponse>> fetchFavourites() async {
    try {
      var response =
          await _apiService.get(endpoint: kFavouritesEndpoint, token: token);
      return Right(GetFavouritesResponse.fromJson(response));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
