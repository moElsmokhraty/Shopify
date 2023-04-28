import 'package:equatable/equatable.dart';
import 'package:store_app/features/favourites/data/models/favourite_model.dart';

class AddOrRemoveFavouriteResponse extends Equatable {
  final bool? status;
  final String? message;
  final FavouriteModel? favouriteModel;

  const AddOrRemoveFavouriteResponse({
    this.status,
    this.message,
    this.favouriteModel,
  });

  factory AddOrRemoveFavouriteResponse.fromJson(Map<String, dynamic> json) {
    return AddOrRemoveFavouriteResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      favouriteModel: json['data'] == null
          ? null
          : FavouriteModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': favouriteModel?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, favouriteModel];
}
