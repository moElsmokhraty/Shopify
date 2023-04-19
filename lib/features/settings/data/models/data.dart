import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int? id;
  final String? token;

  const Data({this.id, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
