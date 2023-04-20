import 'package:equatable/equatable.dart';

class ProductDetails extends Equatable {
  final int? id;
  final num? price;
  final num? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final bool? inFavorites;
  final bool? inCart;
  final List<dynamic>? images;

  const ProductDetails({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.inFavorites,
    this.inCart,
    this.images,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json['id'] as int?,
        price: json['price'] as num?,
        oldPrice: json['old_price'] as num?,
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
        images: json['images'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
        'in_favorites': inFavorites,
        'in_cart': inCart,
        'images': images,
      };

  @override
  List<Object?> get props {
    return [
      id,
      price,
      oldPrice,
      discount,
      image,
      name,
      description,
      inFavorites,
      inCart,
      images,
    ];
  }
}
