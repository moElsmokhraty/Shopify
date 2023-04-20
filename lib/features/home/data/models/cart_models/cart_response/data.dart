import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/data/models/home_data_model/product.dart';

class Cart extends Equatable {
  final int? id;
  final int? quantity;
  final Product? product;

  const Cart({this.id, this.quantity, this.product});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
