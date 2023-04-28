import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/models/user_data_models/user_data.dart';
import 'package:store_app/features/auth/data/models/login_models/login_request.dart';
import 'package:store_app/features/auth/data/repos/login_repo/login_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepoImpl) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final LoginRepoImpl _loginRepoImpl;

  IconData suffix = Icons.visibility_outlined;

  bool isObscure = true;

  final formKey = GlobalKey<FormState>();

  UserData? userData;

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await _loginRepoImpl.login(request);
    result.fold((failure) {
      emit(LoginFailure(failure.errMessage));
    }, (response) {
      if (response.status == true) {
        userData = response.data;
        emit(LoginSuccess(response.data!));
      } else {
        emit(LoginFailure(response.message!));
      }
    });
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
    emit(LoginChangePasswordVisibility());
  }
}
