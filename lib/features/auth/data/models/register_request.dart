import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;

  const RegisterRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        phone: json['phone'] as String?);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      };

  @override
  List<Object?> get props => [name, email, password, phone];
}
