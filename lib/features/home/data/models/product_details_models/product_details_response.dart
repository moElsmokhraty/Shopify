import 'package:equatable/equatable.dart';
import 'package:store_app/core/models/product.dart';

class ProductDetailsResponse extends Equatable {
  final bool? status;
  final dynamic message;
  final Product? product;

  const ProductDetailsResponse({this.status, this.message, this.product});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      product: json['data'] == null
          ? null
          : Product.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': product?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, product];
}
