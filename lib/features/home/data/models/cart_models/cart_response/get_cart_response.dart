import 'package:equatable/equatable.dart';

import 'cart_data.dart';

class GetCartResponse extends Equatable {
  final bool? status;
  final dynamic message;
  final CartData? cartData;

  const GetCartResponse({this.status, this.message, this.cartData});

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    return GetCartResponse(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      cartData: json['data'] == null
          ? null
          : CartData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': cartData?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, cartData];
}
