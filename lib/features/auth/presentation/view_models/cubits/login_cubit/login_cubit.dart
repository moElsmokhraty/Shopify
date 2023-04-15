import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/models/user_data_model/user_data.dart';
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

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await _loginRepoImpl.login(request);
    result.fold((failure) {
      emit(LoginFailure(failure.errMessage));
    }, (response) {
      if (response.status == true) {
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

  String? validatePassword(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please enter password';
    } else {
      if (value.length < 8) {
        return 'password length should be at least 8';
      } else if (RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$')
          .hasMatch(value)) {
        return 'password length should include special characters';
      } else if (RegExp(
              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
          .hasMatch(value)) {
        return 'password length should include numbers';
      } else if (RegExp(
              r'^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
          .hasMatch(value)) {
        return 'password length should include capital characters';
      } else if (RegExp(
              r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
          .hasMatch(value)) {
        return 'password length should include small characters';
      } else {
        return null;
      }
    }
  }

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibility());
  }
}
