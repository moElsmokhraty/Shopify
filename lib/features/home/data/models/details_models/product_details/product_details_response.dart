import 'package:equatable/equatable.dart';

import 'product_details.dart';

class ProductDetailsResponse extends Equatable {
  final bool? status;
  final dynamic message;
  final ProductDetails? details;

  const ProductDetailsResponse({this.status, this.message, this.details});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      details: json['data'] == null
          ? null
          : ProductDetails.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': details?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, details];
}
