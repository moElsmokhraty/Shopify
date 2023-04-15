import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final int? id;
  final String? image;
  final dynamic category;
  final dynamic product;

  const Banner({this.id, this.image, this.category, this.product});

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json['id'] as int?,
        image: json['image'] as String?,
        category: json['category'] as dynamic,
        product: json['product'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'category': category,
        'product': product,
      };

  @override
  List<Object?> get props => [id, image, category, product];
}
