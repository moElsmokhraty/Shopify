import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/cart/data/models/add_or_remove_cart_models/add_or_remove_cart_response.dart';
import 'package:store_app/features/cart/data/models/get_cart_models/get_cart_response.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiService _apiService;

  CartRepoImpl(this._apiService);

  @override
  Future<Either<Failure, AddOrRemoveCartResponse>> addOrRemoveCartItem(
      {required int id}) async {
    try {
      var response = await _apiService.post(
          endpoint: kAddOrRemoveCartEndpoint,
          token: token,
          data: {"product_id": id});
      return Right(AddOrRemoveCartResponse.fromJson(response));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetCartResponse>> fetchCart() async {
    try {
      return Right(GetCartResponse.fromJson(
          await _apiService.get(endpoint: kGetCartEndpoint, token: token)));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
