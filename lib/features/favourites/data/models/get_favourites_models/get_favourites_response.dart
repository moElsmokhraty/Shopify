import 'package:equatable/equatable.dart';

import 'favourite_data.dart';

class GetFavouritesResponse extends Equatable {
  final bool? status;
  final dynamic message;
  final FavouriteData? data;

  const GetFavouritesResponse({this.status, this.message, this.data});

  factory GetFavouritesResponse.fromJson(Map<String, dynamic> json) {
    return GetFavouritesResponse(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      data: json['data'] == null
          ? null
          : FavouriteData.fromJson(json['data'] as Map<String, dynamic>),
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
