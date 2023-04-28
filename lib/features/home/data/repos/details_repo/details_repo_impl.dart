import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/home/data/models/product_details_models/product_details_response.dart';
import 'package:store_app/features/home/data/repos/details_repo/details_repo.dart';

class DetailsRepoImpl implements DetailsRepo {
  final ApiService _apiService;

  DetailsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, ProductDetailsResponse>> fetchProductDetails(
      int productID) async {
    // TODO: implement getProductDetails
    try {
      var response =
          await _apiService.get(endpoint: '$kDetailsEndpoint/$productID');
      return Right(ProductDetailsResponse.fromJson(response));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
