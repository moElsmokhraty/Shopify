import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/models/user_data_model/user_data_response.dart';
import 'package:store_app/features/auth/data/models/register_request.dart';
import 'package:store_app/features/auth/data/repos/register_repo/register_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepoImpl) : super(RegisterInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final RegisterRepoImpl _registerRepoImpl;
  final formKey = GlobalKey<FormState>();
  IconData suffix = Icons.visibility_outlined;
  bool isObscure = true;

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await _registerRepoImpl.register(request);
    result.fold((failure) {
      print(failure.errMessage);
      emit(RegisterFailure(failure.errMessage));
    }, (response) {
      if (response.status == true) {
        emit(RegisterSuccess(response));
      } else {
        print(response.message!);
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
      if (regex.hasMatch(value)) {
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
    emit(RegisterChangePasswordVisibility());
  }
}
