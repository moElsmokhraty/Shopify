import 'package:equatable/equatable.dart';

import 'home_data_model.dart';

class HomeDataResponse extends Equatable {
  final bool? status;
  final dynamic message;
  final HomeDataModel? homeData;

  const HomeDataResponse({this.status, this.message, this.homeData});

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      HomeDataResponse(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        homeData: json['data'] == null
            ? null
            : HomeDataModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': homeData?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, homeData];
}
