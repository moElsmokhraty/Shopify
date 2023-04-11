import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/models/user_data_model/user_data_response.dart';
import 'package:store_app/features/auth/data/models/login_request.dart';
import 'package:store_app/features/auth/data/repos/login_repo/login_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepoImpl) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final LoginRepoImpl _loginRepoImpl;

  IconData suffix = Icons.visibility_outlined;

  bool isObscure = true;

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await _loginRepoImpl.login(request);
    result.fold((failure) {
      emit(LoginFailure(failure.errMessage));
    }, (response) {
      if (response.status == true) {
        
        emit(LoginSuccess(response));
      } else {
        emit(LoginFailure(response.message!));
      }
    });
  }

  String? validateEmail(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z\d.a-zA-Z!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+");
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please enter email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid email';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
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
