import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/home/data/models/favourite_models/favourite_response/favourite_response.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, FavouriteResponse>> getFavourites();
}
