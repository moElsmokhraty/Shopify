import 'package:equatable/equatable.dart';
import 'user_data.dart';

class UserDataResponse extends Equatable {
  final bool? status;
  final String? message;
  final UserData? data;

  const UserDataResponse({this.status, this.message, this.data});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      UserDataResponse(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : UserData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
