import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/home/data/models/cart_models/cart_response/add_or_remove_cart_response.dart';
import 'package:store_app/features/home/data/models/cart_models/cart_response/get_cart_response.dart';
import 'package:store_app/features/home/data/repos/cart_repo/cart_repo.dart';

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
  Future<Either<Failure, GetCartResponse>> getCart() async {
    try {
      return Right(GetCartResponse.fromJson(await _apiService.get(endpoint: kGetCartEndpoint, token: token)));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
