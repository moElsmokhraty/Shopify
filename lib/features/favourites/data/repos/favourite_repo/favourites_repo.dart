import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/favourites/data/models/add_or_remove_favourite_models/add_or_remove_favourite_response.dart';
import 'package:store_app/features/favourites/data/models/get_favourites_models/get_favourites_response.dart';

abstract class FavouritesRepo {
  Future<Either<Failure, GetFavouritesResponse>> fetchFavourites();

  Future<Either<Failure, AddOrRemoveFavouriteResponse>> addOrRemoveFavourite(int productId);
}
