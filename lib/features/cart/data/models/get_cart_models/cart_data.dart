import 'package:equatable/equatable.dart';
import 'package:store_app/features/cart/data/models/cart_model.dart';

class CartData extends Equatable {
  final List<CartModel>? cartItems;
  final int? subTotal;
  final int? total;

  const CartData({this.cartItems, this.subTotal, this.total});

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: json['sub_total'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'cart_items': cartItems?.map((e) => e.toJson()).toList(),
        'sub_total': subTotal,
        'total': total,
      };

  @override
  List<Object?> get props => [cartItems, subTotal, total];
}
