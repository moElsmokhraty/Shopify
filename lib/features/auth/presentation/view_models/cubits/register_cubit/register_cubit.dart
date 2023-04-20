import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/models/user_data_model/user_data_response.dart';
import 'package:store_app/features/auth/data/models/register_models/register_request.dart';
import 'package:store_app/features/auth/data/repos/register_repo/register_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepoImpl) : super(RegisterInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final RegisterRepoImpl _registerRepoImpl;
  final formKey = GlobalKey<FormState>();
  IconData suffix = Icons.visibility_outlined;
  IconData suffixConfirm = Icons.visibility_outlined;
  bool isObscure = true;
  bool isObscureConfirm = true;

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await _registerRepoImpl.register(request);
    result.fold((failure) {
      emit(RegisterFailure(failure.errMessage));
    }, (response) {
      if (response.status == true) {
        emit(RegisterSuccess(response));
      } else {
        emit(RegisterFailure(response.message!));
      }
    });
  }

  String? validateName(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please enter username';
    } else {
      return null;
    }
  }

  String? validatePhone(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please enter phone number';
    } else if (value.length != 11 && value.length != 13) {
      return 'Please enter valid phone number';
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z\d.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$");
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please enter email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Please enter valid email';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String password) {
    bool hasUppercase = false;
    bool hasLowercase = false;
    bool hasNumber = false;
    bool hasSpecialChar = false;

    if (password.isEmpty || password.trim().isEmpty) {
      return 'Please enter password';
    }

    if (password.length < 8) {
      return ('Password must be at least 8 characters long.');
    }

    for (int i = 0; i < password.length; i++) {
      var char = password[i];
      if (RegExp(r'[A-Z]').hasMatch(char)) {
        hasUppercase = true;
      } else if (RegExp(r'[a-z]').hasMatch(char)) {
        hasLowercase = true;
      } else if (RegExp(r'[0-9]').hasMatch(char)) {
        hasNumber = true;
      } else if (RegExp(r'[!@#\$&\*~]').hasMatch(char)) {
        hasSpecialChar = true;
      }
    }

    if (hasUppercase && hasLowercase && hasNumber && hasSpecialChar) {
      return null;
    } else {
      List<String> missingChars = [];
      if (!hasUppercase) {
        missingChars.add('uppercase letters');
      }
      if (!hasLowercase) {
        missingChars.add('lowercase letters');
      }
      if (!hasNumber) {
        missingChars.add('numbers');
      }
      if (!hasSpecialChar) {
        missingChars.add('special characters');
      }
      return ('${missingChars.join(', ')} required');
    }
  }

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isObscureConfirm = !isObscureConfirm;
    suffixConfirm = isObscureConfirm
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }
}
