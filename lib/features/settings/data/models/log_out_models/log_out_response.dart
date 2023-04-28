import 'package:equatable/equatable.dart';

import 'log_out_data.dart';

class LogOutResponse extends Equatable {
  final bool? status;
  final String? message;
  final LogOutData? data;

  const LogOutResponse({this.status, this.message, this.data});

  factory LogOutResponse.fromJson(Map<String, dynamic> json) {
    return LogOutResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LogOutData.fromJson(json['data'] as Map<String, dynamic>),
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
