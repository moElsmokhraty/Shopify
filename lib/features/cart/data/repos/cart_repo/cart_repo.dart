import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/cart/data/models/add_or_remove_cart_models/add_or_remove_cart_response.dart';
import 'package:store_app/features/cart/data/models/get_cart_models/get_cart_response.dart';

abstract class CartRepo {
  Future<Either<Failure, GetCartResponse>> fetchCart();

  Future<Either<Failure, AddOrRemoveCartResponse>> addOrRemoveCartItem(
      {required int id});
}
