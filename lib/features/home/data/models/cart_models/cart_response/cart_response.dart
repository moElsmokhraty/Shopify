import 'package:equatable/equatable.dart';

import 'data.dart';

class CartResponse extends Equatable {
  final bool? status;
  final String? message;
  final Cart? cart;

  const CartResponse({this.status, this.message, this.cart});

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        cart: json['data'] == null
            ? null
            : Cart.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': cart?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, cart];
}
