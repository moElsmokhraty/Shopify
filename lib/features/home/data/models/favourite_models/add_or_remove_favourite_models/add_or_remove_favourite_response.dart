import 'package:equatable/equatable.dart';

import 'add_or_remove_favourite_model.dart';

class AddOrRemoveFavouriteResponse extends Equatable {
  final bool? status;
  final String? message;
  final AddOrRemoveFavouriteModel? data;

  const AddOrRemoveFavouriteResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AddOrRemoveFavouriteResponse.fromJson(Map<String, dynamic> json) {
    return AddOrRemoveFavouriteResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddOrRemoveFavouriteModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
