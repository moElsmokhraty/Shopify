import 'package:equatable/equatable.dart';
import 'package:store_app/core/models/product.dart';

class CartModel extends Equatable {
  final int? id;
  final int? quantity;
  final Product? product;

  const CartModel({this.id, this.quantity, this.product});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product?.toJson(),
      };

  @override
  List<Object?> get props => [id, quantity, product];
}
