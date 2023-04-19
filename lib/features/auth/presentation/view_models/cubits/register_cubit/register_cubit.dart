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
    emit(RegisterChangePasswordVisibility());
  }
  void changeConfirmPasswordVisibility() {
    isObscureConfirm = !isObscureConfirm;
    suffixConfirm =
    isObscureConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }
}
