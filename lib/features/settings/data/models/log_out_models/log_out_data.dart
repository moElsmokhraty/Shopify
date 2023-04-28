import 'package:equatable/equatable.dart';

class LogOutData extends Equatable {
  final int? id;
  final String? token;

  const LogOutData({this.id, this.token});

  factory LogOutData.fromJson(Map<String, dynamic> json) => LogOutData(
        id: json['id'] as int?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
      };

  @override
  List<Object?> get props => [id, token];
}
