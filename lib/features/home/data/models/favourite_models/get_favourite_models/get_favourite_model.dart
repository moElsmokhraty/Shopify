import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/data/models/home_data_model/product.dart';

class GetFavouriteModel extends Equatable {
  final int? id;
  final Product? product;

  const GetFavouriteModel({this.id, this.product});

  factory GetFavouriteModel.fromJson(Map<String, dynamic> json) => GetFavouriteModel(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };

  @override
  List<Object?> get props => [id, product];
}
