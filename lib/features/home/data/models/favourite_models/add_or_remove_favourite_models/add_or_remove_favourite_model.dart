import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/data/models/home_data_model/product.dart';

class AddOrRemoveFavouriteModel extends Equatable {
  final int? id;
  final Product? product;

  const AddOrRemoveFavouriteModel({this.id, this.product});

  factory AddOrRemoveFavouriteModel.fromJson(Map<String, dynamic> json) => AddOrRemoveFavouriteModel(
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
