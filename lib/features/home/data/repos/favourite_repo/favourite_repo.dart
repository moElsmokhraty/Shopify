import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/home/data/models/favourite_models/add_or_remove_favourite_models/add_or_remove_favourite_response.dart';
import 'package:store_app/features/home/data/models/favourite_models/get_favourite_models/get_favourite_response.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, GetFavouriteResponse>> getFavourites();

  Future<Either<Failure, AddOrRemoveFavouriteResponse>> addOrRemoveFavourite(int productId);
}
