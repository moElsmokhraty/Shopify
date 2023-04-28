import 'package:equatable/equatable.dart';

class EditProfileRequest extends Equatable {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? image;

  const EditProfileRequest({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.image,
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) {
    return EditProfileRequest(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'image': image,
      };

  @override
  List<Object?> get props => [name, phone, email, password, image];
}
