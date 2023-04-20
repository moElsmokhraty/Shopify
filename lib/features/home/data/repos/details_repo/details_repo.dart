import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/home/data/models/details_models/product_details/product_details_response.dart';

abstract class DetailsRepo {
  Future<Either<Failure, ProductDetailsResponse>> getProductDetails(
      int productID);
}
