import 'package:equatable/equatable.dart';
import 'package:store_app/features/cart/data/models/cart_model.dart';


class AddOrRemoveCartResponse extends Equatable {
  final bool? status;
  final String? message;
  final CartModel? cart;

  const AddOrRemoveCartResponse({this.status, this.message, this.cart});

  factory AddOrRemoveCartResponse.fromJson(Map<String, dynamic> json) =>
      AddOrRemoveCartResponse(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        cart: json['data'] == null
            ? null
            : CartModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': cart?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, cart];
}
